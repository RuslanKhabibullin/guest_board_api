Hanami::Model.migration do
  change do
    create_table :messages do
      primary_key :id

      foreign_key :user_id, :users, on_delete: :set_null
      column :content, 'TEXT', null: false

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
