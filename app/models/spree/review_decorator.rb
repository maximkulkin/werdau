Spree::Review.class_eval do
  validates_presence_of :pros, :cons, :rating
  validates :usage_period_unit, :presence => true, :inclusion => ['day', 'week', 'month', 'year'],
    :if => lambda { |review| review.usage_period_value }

  scope :for_product, lambda { |product| where(:product_id => product.id) }
end
