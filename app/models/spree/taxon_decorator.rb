
Spree::Taxon.class_eval do
  attachment_definitions[:icon][:styles] = { :normal => '64x64>' }
  attachment_definitions[:icon][:default_style] = :normal

  has_many :product_filters

  def reindex_products
    # TODO: run indexing in background job
    products.find_each(:batch_size => 100, &:index)
  end
end

