class AddProductFilters < ActiveRecord::Migration
  def change
    create_table :spree_product_filters do |t|
      t.string :title
      t.references :taxon
      t.string :type
      t.references :property
      t.string :value_type
    end
  end
end
