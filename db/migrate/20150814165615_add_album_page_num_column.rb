class AddAlbumPageNumColumn < ActiveRecord::Migration
  def change
    add_column :albums, :page_num, :integer
  end
end
