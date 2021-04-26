require 'sidekiq/web'

# Configure your routes here
# See: https://guides.hanamirb.org/routing/overview

mount Sidekiq::Web, at: '/sidekiq'

get '/', to: 'home#index'

resources :users, only: %i[new create edit update show] do
  resources :accounts, only: %i[show update], controller: 'accounts'
end
