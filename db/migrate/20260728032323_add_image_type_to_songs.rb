class AddImageTypeToSongs < ActiveRecord::Migration[8.1]
  def change
    add_column :songs, :image_type, :string
  end
end
