class User < Hanami::Entity
  attributes do
    attribute :client_id,    Types::String
    attribute :name,         Types::String
    attribute :api_token,    Types::String
    attribute :web_hook_url, Types::String
    attribute :permissions,  Types::String
    attribute :accounts,     Types::Collection(Account)
  end
end
