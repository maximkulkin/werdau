Spree::Product.class_eval do
  reflect_on_association(:product_properties).options[:order] = 'position asc'

  def to_param
    permalink.present? ? permalink : (permalink_was || name.to_s.to_url.gsub("'", ''))
  end

  scope :with_no_images, where("(select count(*) from spree_assets where type = 'Spree::Image' and viewable_type = 'Spree::Product' and viewable_id = spree_products.id) = 0")
  scope :with_no_properties, where("(select count(*) from spree_product_properties where product_id = spree_products.id) = 0")

  search_methods :with_no_images, :with_no_properties

  def rating
    stars.to_f
  end

  searchable do
    text :name
    string :name, :stored => true
    float :price, :stored => true
    float :rating, :stored => true

    integer :taxon_ids, :multiple => true

    %w{string integer boolean}.each do |type|
      send(:"dynamic_#{type}", :"#{type}_property", :stored => true) do
        filters = taxons.collect { |t| t.product_filters }.flatten
        filters.select! { |f| f.value_type == type }
        filters.inject({}) do |fields,filter|
          fields.merge(filter.extract_data(self))
        end
      end
    end
  end
end

