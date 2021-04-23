Hanami::Model.migration do
  change do
    create_table :statement_items do
      primary_key :id, String, null: false

      foreign_key :account_id, :accounts, type: String, null: false, on_delete: :cascade, on_update: :restrict

      foreign_key :mcc, :mcc_codes, type: Integer, null: false, on_delete: :cascade, on_update: :restrict
      foreign_key :original_mcc, :mcc_codes, type: Integer, null: false, on_delete: :restrict, on_update: :restrict
      foreign_key :edited_mcc, :mcc_codes, type: Integer, null: true, on_delete: :restrict, on_update: :restrict

      column :time,             DateTime,  null: false
      column :description,      String,    null: false
      column :comment,          String,    null: true
      # column :mcc,              Integer,   null: false
      # column :original_mcc,     Integer,   null: false
      # column :edited_mcc,       Integer,   null: true
      column :amount,           :Bignum,   null: false
      column :operation_amount, :Bignum,   null: false
      column :currency_code,    Integer,   null: false
      column :commission_rate,  :Bignum,   null: false
      column :cashback_amount,  :Bignum,   null: false
      column :balance,          :Bignum,   null: false
      column :hold,             TrueClass, null: false
      column :receipt_id,       String,    null: true
      column :counter_edrpou,   String,    null: true
      column :counter_iban,     String,    null: true

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
