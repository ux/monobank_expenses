Hanami::Model.migration do
  change do
    extension :pg_enum

    create_enum :account_types,  %w[black white platinum iron fop yellow]
    create_enum :cashback_types, %w[None UAH Miles]

    create_table :accounts do
      primary_key :id, String, null: false

      foreign_key :client_id, :users, type: String, null: false, on_delete: :cascade, on_update: :restrict

      column :currency_code, Integer,          null: false
      column :cashback_type, 'cashback_types', null: false
      column :balance,       :Bignum,          null: false
      column :credit_limit,  :Bignum,          null: false
      column :masked_pan,    'text[]',         null: false
      column :type,          'account_types',  null: false
      column :iban,          String,           null: false

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
