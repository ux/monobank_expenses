SIDEKIQ_REDIS_CONFIGURATION = {
  url: ENV[ENV['REDIS_PROVIDER']],
  ssl_params: { verify_mode: OpenSSL::SSL::VERIFY_NONE }
}

Sidekiq.configure_server do |config|
  config.redis = SIDEKIQ_REDIS_CONFIGURATION
end

Sidekiq.configure_client do |config|
  config.redis = SIDEKIQ_REDIS_CONFIGURATION
end
