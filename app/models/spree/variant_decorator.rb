Spree::Variant.class_eval do
  has_many :products_kit_items

  def products_kits
  	self.products_kit_items.collect(&:products_kit).uniq.compact.select(&:enabled)
  end
end