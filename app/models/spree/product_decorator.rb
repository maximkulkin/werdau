Spree::Product.class_eval do
  reflect_on_association(:product_properties).options[:order] = 'position asc'

  def to_param
    permalink.present? ? permalink : (permalink_was || name.to_s.to_url.gsub("'", ''))
  end

  scope :with_no_images, where("(select count(*) from spree_assets where type = 'Spree::Image' and viewable_type = 'Spree::Product' and viewable_id = spree_products.id) = 0")
  scope :with_no_properties, where("(select count(*) from spree_product_properties where product_id = spree_products.id) = 0")

  search_methods :with_no_images, :with_no_properties
end

