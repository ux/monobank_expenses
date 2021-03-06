require_relative '../../types'

class StatementItem < Hanami::Entity
  attributes do
    attribute :id,               Types::String
    attribute :account_id,       Types::String
    attribute :time,             ::Types::Time
    attribute :description,      Types::String
    attribute :comment,          Types::String
    attribute :mcc,              Types::Int
    attribute :original_mcc,     Types::Int
    attribute :edited_mcc,       Types::Int
    attribute :amount,           Types::Int
    attribute :operation_amount, Types::Int
    attribute :currency_code,    Types::Int
    attribute :commission_rate,  Types::Int
    attribute :cashback_amount,  Types::Int
    attribute :balance,          Types::Int
    attribute :hold,             Types::Bool
    attribute :receipt_id,       Types::String
    attribute :counter_edrpou,   Types::String
    attribute :counter_iban,     Types::String
    attribute :created_at,       Types::Time
    attribute :updated_at,       Types::Time
  end

  def was_created?
    updated_at == created_at
  end
end
