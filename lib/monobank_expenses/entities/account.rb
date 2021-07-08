class Account < Hanami::Entity
  ACCOUNT_TYPES  = %w[black white platinum iron fop yellow].freeze
  CASHBACK_TYPES = %w[None UAH Miles].freeze

  attributes do
    attribute :id,                 Types::String
    attribute :client_id,          Types::String
    attribute :currency_code,      Types::Int
    attribute :cashback_type,      Types::String.enum(*CASHBACK_TYPES)
    attribute :balance,            Types::Int
    attribute :credit_limit,       Types::Int
    attribute :balance_correction, Types::Int
    attribute :masked_pan,         Types::Collection(Types::String)
    attribute :type,               Types::String.enum(*ACCOUNT_TYPES)
    attribute :iban,               Types::String
    attribute :created_at,         Types::Time
    attribute :updated_at,         Types::Time
  end

  def corrected_balance_without_credit
    balance + balance_correction - credit_limit
  end
end
