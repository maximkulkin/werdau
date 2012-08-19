class AddPositionToProductFilters < ActiveRecord::Migration
  def change
    change_table :spree_product_filters do |t|
      t.integer :position
    end

    say_with_time 'init positions' do
      Spree::Taxon.all.each do |taxon|
        taxon.product_filters.each_with_index do |filter, index|
          filter.position = index
          filter.save
        end
      end
    end
  end
end
