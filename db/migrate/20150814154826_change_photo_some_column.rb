class ChangePhotoSomeColumn < ActiveRecord::Migration
  def change
    remove_column :photos, :upload_file_name
    remove_column :photos, :upload_file
    add_column :photos, :img_path, :string
  end
end
