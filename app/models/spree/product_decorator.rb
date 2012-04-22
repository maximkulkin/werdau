Spree::Product.class_eval do
  reflect_on_association(:product_properties).options[:order] = 'position asc'
end

