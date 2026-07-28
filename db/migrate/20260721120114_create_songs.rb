class CreateSongs < ActiveRecord::Migration[8.1]
  def change
    create_table :songs do |t|
      t.string :title
      t.string :vocal
      t.string :songwriting
      t.string :url
      t.binary :image

      t.timestamps
    end
  end
end
