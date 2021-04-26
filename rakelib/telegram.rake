require 'telegram/bot'
require_relative '../config/boot'

namespace :telegram do
  desc 'Setup telegram webhook'
  task :setup do
    Container['telegram.telegram_client'].api.set_webhook(url: Webhooks.routes.telegram_url)
  end

  desc 'Delete telegram webhook'
  task :teardown do
    Container['telegram.telegram_client'].api.delete_webhook(drop_pending_updates: true)
  end
end
