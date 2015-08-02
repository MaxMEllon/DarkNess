class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name, null: false, default: ''

      t.timestamps null: false
    end
  end
end
