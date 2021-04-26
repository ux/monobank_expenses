require_relative '../../../apps/web/helpers/account'

class PropagateStatementUpdate
  include Sidekiq::Worker
  include Hanami::Helpers::NumberFormattingHelper
  include Web::Helpers::Account

  include Import[
    'telegram.telegram_client',
    'repositories.user_repository',
    'repositories.account_repository',
    'repositories.statement_item_repository'
  ]

  def perform(client_id, account_id, statement_item_id)
    user           = user_repository.find(client_id)
    account        = account_repository.find(account_id)
    statement_item = statement_item_repository.find(statement_item_id)

    send_telegram_notification(user, account, statement_item) if user.telegram_chat_id
  end

  private

  def send_telegram_notification(user, account, statement_item)
    telegram_client.api.send_message(
      chat_id: user.telegram_chat_id,
      text: message_text(user, account, statement_item)
    )
  end

  def message_text(user, account, statement_item)
    <<~MESSAGE
      Hey, #{user.name}!
      You've just spent some money. Here are some details:

      #{statement_item.description}
      #{statement_item.comment}
      Amount: #{format_currency statement_item.amount}
      Commission rate: #{format_currency statement_item.commission_rate}
      Cashback amount: #{format_currency statement_item.cashback_amount}
      Balance: #{format_currency statement_item.balance}
    MESSAGE
  end
end
