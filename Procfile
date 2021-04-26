web: bundle exec hanami server --no-code-reloading --port=$PORT
worker: bundle exec sidekiq -r ./config/boot.rb -C ./config/sidekiq.yml
