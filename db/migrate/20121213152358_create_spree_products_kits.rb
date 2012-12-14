class CreateSpreeProductsKits < ActiveRecord::Migration
  def change
    create_table :spree_products_kits do |t|
      t.boolean :enabled

      t.timestamps
    end
  end
end
