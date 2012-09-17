
Spree::Taxon.class_eval do
  attachment_definitions[:icon][:styles] = { :normal => '64x64>' }
  attachment_definitions[:icon][:default_style] = :normal

  has_many :product_filters, :order => 'position asc'
  accepts_nested_attributes_for :product_filters

  def all_product_properties
    Spree::Property.includes(:products => :taxons).where(['spree_taxons.id = ?', id])
  end

  def reindex_products
    # TODO: run indexing in background job
    product_filters.update_all(:indexed_at => DateTime.now)
    products.active.find_each(:batch_size => 100, &:index)
  end
end

