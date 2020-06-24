class CreatePhotos < ActiveRecord::Migration[6.0]
  def up
    create_table :photos do |t|
    	t.references :post
      t.timestamps
    end

    add_attachment :photos, :image
  end

  def down
  	drop_table :photos
  end
end
