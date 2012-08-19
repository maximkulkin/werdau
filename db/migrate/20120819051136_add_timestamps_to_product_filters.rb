class AddTimestampsToProductFilters < ActiveRecord::Migration
  def change
    change_table :spree_product_filters do |t|
      t.timestamps
      t.timestamp :indexed_at, :default => nil
    end

    say_with_time 'init timestamps' do
      Spree::ProductFilter.update_all(
        :created_at => DateTime.now,
        :updated_at => DateTime.now
      )
    end
  end
end
