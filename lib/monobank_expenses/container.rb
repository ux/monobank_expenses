require 'dry-container'
require 'dry-auto_inject'

class Container
  extend Dry::Container::Mixin

  namespace :telegram do
    register :telegram_client do
      Telegram::Bot::Client.new(ENV.fetch('TELEGRAM_TOKEN'), logger: Hanami.logger)
    end

    register(:telegram_types)      { Telegram::Bot::Types }
    register(:telegram_exceptions) { Telegram::Bot::Exceptions }
  end

  namespace :repositories do
    register(:user_repository)           { UserRepository.new }
    register(:account_repository)        { AccountRepository.new }
    register(:statement_item_repository) { StatementItemRepository.new }
  end
end

Import = Dry::AutoInject(Container)
