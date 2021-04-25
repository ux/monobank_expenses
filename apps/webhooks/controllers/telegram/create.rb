require 'telegram/bot'

module Webhooks
  module Controllers
    module Telegram
      class Create
        include Webhooks::Action

        accept :json

        def call(params)
          Hanami.logger(params.raw)
          # # instantiate a client update object
          # update = Telegram::Bot::Types::Update.new(data)
          #
          # update_id = update.update_id
          # message = update.message
          #
          # unless message.nil?
          #     message_id = message.message_id
          #
          #     # ####################################
          #     # PUT HERE BELOW YOUR UPDATE BOT LOGIC
          #     # ####################################
          #
          #     # echo-server, just for test purpose
          #     case message.text
          #     when /.+/
          #       text = "#{message.from.first_name}:#{message.text}"
          #       chat_id = message.chat.id
          #
          #       # send echo tu user
          #       client.api.send_message(chat_id: chat_id, text: text)
          #       puts "#{self.class.name}:#{text}"
          #     end
          # end

        end
      end
    end
  end
end
