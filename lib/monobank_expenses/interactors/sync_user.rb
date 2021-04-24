require 'hanami/interactor'

class SyncUser
  include Hanami::Interactor

  expose :user

  def initialize(monobank_class: Monobank::Client,
                 monobank_error: Monobank::Error,
                 users:          UserRepository.new,
                 accounts:       AccountRepository.new,
                 webhook_url:    Webhooks.routes.monobank_url)
    @monobank_class = monobank_class
    @monobank_error = monobank_error
    @users          = users
    @accounts       = accounts
  end

  def call(user, webhook_url:)
    @user = sync_user(retrieve_user_and_set_webhook(user.api_token, webhook_url))
  end

  private

  def retrieve_user_and_set_webhook(api_token, webhook_url)
    monobank = @monobank_class.new(api_token)

    monobank.set_webhook(Webhooks.routes.monobank_url)

    user_attributes = monobank.client_info.merge(api_token: api_token)

    @users.class.entity.new(user_attributes)
  rescue @monobank_error => error
    error!(error.message)
  end

  def sync_user(user)
    @users.transaction do
      @users.sync(user) do |_updated_user|
        user.accounts.each { |account| @accounts.sync(user, account) }
      end
    end
  end
end
