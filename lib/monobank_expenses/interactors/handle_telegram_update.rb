require 'hanami/interactor'

class HandleTelegramUpdate
  include Hanami::Interactor

  def initialize(telegram_client_class: Telegram::Bot::Client,
                 telegram_update_class: Telegram::Bot::Types::Update,
                 users:                 UserRepository.new)
    @telegram_client       = telegram_client_class.new(ENV.fetch('TELEGRAM_TOKEN'), logger: Hanami.logger)
    @telegram_update_class = telegram_update_class
    @users                 = users
  end

  def call(params)
    update = @telegram_update_class.new(params)

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
    @telegram_client.api.send_message(
      chat_id: message.chat.id,
      text: "Hey, #{message.from.first_name}!",
      reply_markup: request_contact_markup
    )
  end

  def process_contact(message)
    user = @users.find_by_phone_number(message.contact.phone_number)

    reply_message = if user
      @users.update(user.id, telegram_chat_id: message.chat.id)

      'Thank you! I will post updates once you will start spending money.'
    else
      'Sorry, but I\'m unable to find your account...'
    end

    @telegram_client.api.send_message(
      chat_id: message.chat.id,
      text: reply_message
    )
  end

  def process_unknown_command(message)
    @telegram_client.api.send_message(
      chat_id: message.chat.id,
      text: 'Sorry, I don\'t know how to handle this message.'
    )
  end

  def request_contact_markup
    keyboard = [
      Telegram::Bot::Types::KeyboardButton.new(text: 'Provide your phone number', request_contact: true)
    ]

    Telegram::Bot::Types::ReplyKeyboardMarkup.new(keyboard: keyboard)
  end
end
