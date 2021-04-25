require 'telegram/bot'

namespace :telegram do
  desc "Setup telegram webhook"
  task :setup do
    client = Telegram::Bot::Client.new(ENV.fetch('TELEGRAM_TOKEN'), logger: Hanami.logger)
    resp = client.api.set_webhook(url: Webhooks.routes.telegram_url)
  end
end
