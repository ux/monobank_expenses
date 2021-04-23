# Configure your routes here
# See: https://guides.hanamirb.org/routing/overview

get '/', to: 'home#index'

resources :users, only: %i[new create show] do
  resources :accounts, only: %i[show update], controller: 'accounts'
end
