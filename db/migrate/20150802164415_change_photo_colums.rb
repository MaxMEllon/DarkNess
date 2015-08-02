class ChangePhotoColums < ActiveRecord::Migration
  def change
    change_table :photos do |t|
      t.string :upload_file_name
      t.binary :upload_file
    end
  end
end
