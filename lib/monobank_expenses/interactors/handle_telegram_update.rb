require 'hanami/interactor'

class HandleTelegramUpdate
  include Hanami::Interactor

  include Import[
    'telegram.telegram_client',
    'telegram.telegram_types',
    'telegram.telegram_exceptions',
    'repositories.user_repository'
  ]

  def call(params)
    update = telegram_types::Update.new(params)

    process_message(update.message) if update.message
  end

  private

  def process_message(message)
    if message.text == '/start'
      process_start_command(message)
    elsif message.contact
      process_contact(message)
    else
      process_unknown_command(message)
    end
  end

  def process_start_command(message)
    telegram_client.api.send_message(
      chat_id: message.chat.id,
      text: "Hey, #{message.from.first_name}!",
      reply_markup: request_contact_markup
    )
  end

  def process_contact(message)
    user = user_repository.find_by_phone_number(message.contact.phone_number)

    reply_message = if user
      user_repository.update(user.client_id, telegram_chat_id: message.chat.id)

      'Thank you! I will post updates once you will start spending money.'
    else
      'Sorry, but I\'m unable to find your account...'
    end

    telegram_client.api.send_message(
      chat_id: message.chat.id,
      text: reply_message
    )
  end

  def process_unknown_command(message)
    telegram_client.api.send_message(
      chat_id: message.chat.id,
      text: 'Sorry, I don\'t know how to handle this message.'
    )
  rescue telegram_exceptions::ResponseError
    # No need to handle errors for unknown commands
    nil
  end

  def request_contact_markup
    keyboard = [
      telegram_types::KeyboardButton.new(text: 'Provide your phone number', request_contact: true)
    ]

    telegram_types::ReplyKeyboardMarkup.new(keyboard: keyboard)
  end
end
