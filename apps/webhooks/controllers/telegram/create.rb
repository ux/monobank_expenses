require 'telegram/bot'

module Webhooks
  module Controllers
    module Telegram
      class Create
        include Webhooks::Action

        accept :json

        def initialize(handle_telegram_update: HandleTelegramUpdate.new)
          @handle_telegram_update = handle_telegram_update
        end

        def call(params)
          @handle_telegram_update.call(params)

          status 200, 'OK'
        end
      end
    end
  end
end
