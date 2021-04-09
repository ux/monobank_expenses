class Account < Hanami::Entity
  ACCOUNT_TYPES  = %w[black white platinum iron fop yellow].freeze
  CASHBACK_TYPES = %w[None UAH Miles].freeze

  attributes do
    attribute :id,            Types::String
    attribute :currency_code, Types::Int
    attribute :cashback_type, Types::String.enum(*CASHBACK_TYPES)
    attribute :balance,       Types::Int
    attribute :credit_limit,  Types::Int
    attribute :masked_pan,    Types::Collection(Types::String)
    attribute :type,          Types::String.enum(*ACCOUNT_TYPES)
    attribute :iban,          Types::String
  end
end
