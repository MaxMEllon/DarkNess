class ChangeAlbumColum < ActiveRecord::Migration
  def change
    change_table :albums do |t|
      t.binary :zip
    end
  end
end
