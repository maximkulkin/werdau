Spree::Product.class_eval do
  reflect_on_association(:product_properties).options[:order] = 'position asc'

  def to_param
    permalink.present? ? permalink : (permalink_was || name.to_s.to_url.gsub("'", ''))
  end
end

