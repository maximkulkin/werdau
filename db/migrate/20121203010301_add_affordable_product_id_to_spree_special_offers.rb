class AddAffordableProductIdToSpreeSpecialOffers < ActiveRecord::Migration
  def change
  	add_column :spree_special_offers, :affordable_product_id, :integer
  end
end
