class CreateSpreeSpecialOffers < ActiveRecord::Migration
  def change
    create_table :spree_special_offers do |t|
      t.integer :taxon_id
      t.integer :popular_product_id
      t.integer :best_product_id

      t.timestamps
    end
  end
end
