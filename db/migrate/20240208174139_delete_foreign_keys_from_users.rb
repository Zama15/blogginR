class DeleteForeignKeysFromUsers < ActiveRecord::Migration[7.1]
  def change
    change_column :comments, :author_id, :bigint, null: true
    change_column :posts, :author_id, :bigint, null: true
    change_column :preferences, :user_id, :bigint, null: true

    add_foreign_key :comments, :users, column: :author_id, primary_key: :id, on_delete: :nullify
    add_foreign_key :posts, :users, column: :author_id, primary_key: :id, on_delete: :cascade
    add_foreign_key :preferences, :users, column: :user_id, primary_key: :id, on_delete: :cascade
  end
end
