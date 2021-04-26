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

  BILLING_DAY = 7

  def perform(statement_item_id)
    statement_item = statement_item_repository.find(statement_item_id)
    account        = account_repository.find(statement_item.account_id)
    user           = user_repository.find(account.client_id)

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
    balance = account.balance_without_credit
    balance_per_day = balance.to_f / days_left_before_new_billing_period
    spent_today = amount_spent_today(account)

    <<~MESSAGE
      Hey, #{user.name}!
      You've just spent some money. Here are some details:

      #{statement_item.description}
      #{statement_item.comment}
      Amount: #{format_currency statement_item.amount}
      Commission rate: #{format_currency statement_item.commission_rate}
      Cashback amount: #{format_currency statement_item.cashback_amount}
      Balance: #{format_currency balance}
      Budget per day: #{format_currency balance_per_day}
      Spend today: #{format_currency spent_today}
      Budget left for today: #{format_currency balance_per_day + spent_today}
    MESSAGE
  end

  def amount_spent_today(account)
    statement_item_repository.find_between(account, today, today + 1).sum(&:amount)
  end

  def start_of_billing_period
    Date.new(today.year, today.month + (today.day < BILLING_DAY ? -1 : 0), BILLING_DAY)
  end

  def end_of_billing_period
    start_of_billing_period >> 1
  end

  def days_left_before_new_billing_period
    (end_of_billing_period - today).to_i
  end

  def today
    @today ||= Date.today
  end
end
