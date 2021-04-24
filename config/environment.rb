require 'bundler/setup'
require 'hanami/setup'
require 'hanami/model'
require_relative '../lib/monobank_expenses'
require_relative '../apps/web/application'
require_relative '../apps/webhooks/application'

Hanami.configure do
  mount Webhooks::Application, at: '/' + ENV.fetch('WEBHOOKS_SECRET_TOKEN')
  mount Web::Application, at: '/'

  model do
    ##
    # Database adapter
    #
    # Available options:
    #
    #  * SQL adapter
    #    adapter :sql, 'sqlite://db/monobank_expenses_development.sqlite3'
    #    adapter :sql, 'postgresql://localhost/monobank_expenses_development'
    #    adapter :sql, 'mysql://localhost/monobank_expenses_development'
    #
    adapter :sql, ENV.fetch('DATABASE_URL')

    ##
    # Migrations
    #
    migrations 'db/migrations'
    schema     'db/schema.sql'
  end

  mailer do
    root 'lib/monobank_expenses/mailers'

    # See https://guides.hanamirb.org/mailers/delivery
    delivery :test
  end

  environment :development do
    # See: https://guides.hanamirb.org/projects/logging
    logger level: :debug
  end

  environment :production do
    # logger level: :info, formatter: :json, filter: []
    logger level: :debug

    # mailer do
    #   delivery :smtp, address: ENV.fetch('SMTP_HOST'), port: ENV.fetch('SMTP_PORT')
    # end
  end
end
