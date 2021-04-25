require 'telegram/bot'
require_relative '../config/environment'

Hanami.boot

namespace :telegram do
  desc 'Setup telegram webhook'
  task :setup do
    client = Telegram::Bot::Client.new(ENV.fetch('TELEGRAM_TOKEN'), logger: Hanami.logger)
    response = client.api.set_webhook(url: Webhooks.routes.telegram_url)
  end
end
