class CreateSpreeSpecialOfferEmptyTaxonBindings < ActiveRecord::Migration
  def up
    create_table :spree_special_offer_empty_taxon_bindings do |t|
      t.integer :empty_taxon_id
      t.integer :special_offer_taxon_id
      t.timestamps
    end
  end

  def down
    drop_table :spree_special_offer_empty_taxon_bindings
  end
end
