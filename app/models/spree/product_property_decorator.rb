Spree::ProductProperty.class_eval do
  acts_as_list :scope => :product
  attr_accessible :property_name, :value, :position
end

