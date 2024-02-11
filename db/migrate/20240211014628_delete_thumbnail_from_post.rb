class DeleteThumbnailFromPost < ActiveRecord::Migration[7.1]
  def change
    remove_column :posts, :thumbnail, :string
  end
end
