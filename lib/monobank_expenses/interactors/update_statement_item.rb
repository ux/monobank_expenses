require 'hanami/interactor'
require_relative '../../../apps/web/helpers/account'

class UpdateStatementItem
  include Hanami::Interactor
  include Hanami::Helpers::NumberFormattingHelper
  include Web::Helpers::Account

  def initialize(accounts:              AccountRepository.new,
                 statement_items:       StatementItemRepository.new,
                 users:                 UserRepository.new,
                 telegram_client_class: Telegram::Bot::Client)
    @accounts        = accounts
    @statement_items = statement_items
    @users           = users
    @telegram_client = telegram_client_class.new(ENV.fetch('TELEGRAM_TOKEN'), logger: Hanami.logger)
  end

  def call(account_id, statement_item_attributes)
    account        = @accounts.class.entity.new(id: account_id)
    statement_item = @statement_items.class.entity.new(statement_item_attributes)

    updated_statement_item, updated_account = @accounts.transaction do
      [
        @statement_items.sync(account, statement_item),
        @accounts.update(account.id, balance: @statement_items.last_for(account).balance)
      ]
    end

    deliver_update(updated_account, updated_statement_item)
  end

  def deliver_update(account, statement_item)
    user = @users.find(account.client_id)

    return unless user.telegram_chat_id

    @telegram_client.api.send_message(
      chat_id: user.telegram_chat_id,
      text: <<~MESSSAGE
        Hey, #{user.name}!
        You've just spent some money. Here are some details:

        #{statement_item.description}
        #{statement_item.comment}
        Amount: #{format_currency statement_item.amount}
        Commission rate: #{format_currency statement_item.commission_rate}
        Cashback amount: #{format_currency statement_item.cashback_amount}
        Balance: #{format_currency statement_item.balance}
      MESSSAGE
    )
  end
end
