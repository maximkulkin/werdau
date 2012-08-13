class CreateSpreeAdvertisements < ActiveRecord::Migration
  def change
    create_table :spree_advertisements do |t|
      t.string  :title
      t.string  :link
      t.string  :vertical_image_file_name
      t.string  :gorizontal_image_file_name
      t.timestamps
    end
  end
end
