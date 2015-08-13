class ChangeAlbumZipColumn < ActiveRecord::Migration
  def change
    remove_column :albums, :zip
    add_column :albums, :zip_path, :string
  end
end
