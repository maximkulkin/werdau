
class Spree::SpecialOffer < ActiveRecord::Base
  belongs_to :taxon

  # NOTE: change semantics, respecting foreign_key on this model
  belongs_to :popular_product, class_name: 'Spree::Product', foreign_key: "popular_product_id"
  belongs_to :best_product, class_name: 'Spree::Product', foreign_key: "best_product_id"


  def to_param
    id.to_s
  end

  def affordable_product
    if affordable_product_id
      Spree::Product.find affordable_product_id
    else
      return nil unless taxon.present?
      taxon.products.joins(:variants_including_master).order("spree_variants.price ASC").limit(1).first
    end
  end

  def available?
    affordable_product && popular_product.present? && best_product.present? && \
    (Spree::Config[:show_zero_stock_products] || \
      (popular_product.has_stock? && best_product.has_stock?))
  end
end
