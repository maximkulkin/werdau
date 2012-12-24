class Spree::ProductsKitItem < ActiveRecord::Base
  belongs_to :products_kit
  belongs_to :variant

  attr_accessible :calculator_type, :discount, :is_primary, :products_kit_id, :variant_id
end
