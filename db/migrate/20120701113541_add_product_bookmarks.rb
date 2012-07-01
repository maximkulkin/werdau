class AddProductBookmarks < ActiveRecord::Migration
  def change
    create_table :spree_user_product_bookmarks do |t|
      t.references :user
      t.references :variant
    end
  end
end
