Hanami::Model.migration do
  change do
    create_table :users do
      primary_key :client_id, String, null: false

      column :name,         String, null: false
      column :api_token,    String, null: false, unique: true
      column :web_hook_url, String, null: false
      column :permissions,  String, null: false

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
