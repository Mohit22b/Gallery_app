class CreateAlbums < ActiveRecord::Migration[7.0]
  def change
    create_table :albums do |t|
      t.string :name
      t.text :description
      t.boolean :published
      t.boolean :allow_download

      t.timestamps
    end
  end
end
