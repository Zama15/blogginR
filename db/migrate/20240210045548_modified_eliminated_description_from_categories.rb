class ModifiedEliminatedDescriptionFromCategories < ActiveRecord::Migration[7.1]
  def change
    remove_column :categories, :description, :string
    remove_column :categories, :eliminated, :boolean

    # macro timestamps

    add_column :categories, :created_at, :datetime, precision: nil, null: false, default: -> { "CURRENT_TIMESTAMP" }
    add_column :categories, :updated_at, :datetime, precision: nil
  end
end
