require 'hanami/interactor'

class SyncUser
  include Hanami::Interactor

  def initialize(monobank_class: Monobank::Client,
                 monobank_error: Monobank::Error,
                 users:          UserRepository.new,
                 accounts:       AccountRepository.new)
    @monobank_class = monobank_class
    @monobank_error = monobank_error
    @users          = users
    @accounts       = accounts
  end

  def call(user)
    sync_user(retrieve_user(user.api_token))
  end

  private

  def retrieve_user(api_token)
    monobank = @monobank_class.new(api_token)

    user_attributes = monobank.client_info.merge(api_token: api_token)

    @users.class.entity.new(user_attributes)
  rescue @monobank_error => error
    error!(error.message)
  end

  def sync_user(user)
    @users.transaction do
      @users.sync(user.client_id, user) do |_updated_user|
        user.accounts.each { |account| @accounts.sync(account.id, account) }
      end
    end
  end
end
