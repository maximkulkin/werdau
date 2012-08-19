class FixAdvertisementHorizontalImageName < ActiveRecord::Migration
  def change
    rename_column :spree_advertisements,
      :gorizontal_image_file_name,
      :horizontal_image_file_name
  end
end
