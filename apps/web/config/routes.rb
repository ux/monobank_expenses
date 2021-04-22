# Configure your routes here
# See: https://guides.hanamirb.org/routing/overview

get '/', to: 'home#index'

resources :users, only: [:index, :new, :create, :show]
