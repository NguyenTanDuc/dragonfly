class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :title
      t.string :image_uid
      t.integer :image_size

      t.timestamps null: false
    end
  end
end
