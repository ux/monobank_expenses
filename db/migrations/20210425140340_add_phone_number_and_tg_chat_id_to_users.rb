Hanami::Model.migration do
  change do
    alter_table :users do
      add_column :phone_number,     String,  null: true, unique: true
      add_column :telegram_chat_id, :Bignum, null: true

      add_index :phone_number
    end
  end
end
