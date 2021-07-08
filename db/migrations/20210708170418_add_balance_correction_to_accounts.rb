Hanami::Model.migration do
  change do
    alter_table :accounts do
      add_column :balance_correction, :Bignum, null: false, default: 0
    end
  end
end
