require_relative '../../types'

class CurrencyInfo < Hanami::Entity
  attributes do
    attribute :currency_code_a, Types::Int
    attribute :currency_code_b, Types::Int
    attribute :date,            ::Types::Time
    attribute :rate_sell,       Types::Float
    attribute :rate_buy,        Types::Float
    attribute :rate_cross,      Types::Float
  end
end
