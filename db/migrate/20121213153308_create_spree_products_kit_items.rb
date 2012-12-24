class CreateSpreeProductsKitItems < ActiveRecord::Migration
  def change
    create_table :spree_products_kit_items do |t|
      t.integer :products_kit_id
      t.integer :variant_id
      t.boolean :is_primary
      t.integer :discount
      t.string :discount_calculator

      t.timestamps
    end
  end
end
