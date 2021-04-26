require 'telegram/bot'
require_relative '../config/boot'

namespace :telegram do
  telegram_client = Telegram::Bot::Client.new(ENV.fetch('TELEGRAM_TOKEN'), logger: Hanami.logger)

  desc 'Setup telegram webhook'
  task :setup do
    telegram_client.api.set_webhook(url: Webhooks.routes.telegram_url)
  end

  desc 'Delete telegram webhook'
  task :teardown do
    telegram_client.api.delete_webhook(drop_pending_updates: true)
  end
end
