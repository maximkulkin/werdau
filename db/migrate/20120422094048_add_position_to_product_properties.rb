class AddPositionToProperties < ActiveRecord::Migration
  def up
    add_column :spree_product_properties, :position, :integer

    say_with_time 'initializing positions' do
      init_product_property_positions
    end
  end

  def down
    remove_column :spree_product_properties, :position
  end

  private

  def init_product_property_positions
    count = 0
    Spree::Product.all.each do |product|
      ActiveRecord::Base.transaction do
        product.product_properties.each_with_index do |property, i|
          property.position = i+1
          property.save
          count += 1
        end
      end
    end
    count
  end
end
