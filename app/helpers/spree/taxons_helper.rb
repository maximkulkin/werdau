module Spree::TaxonsHelper
  def in_special_offer_for_taxon?(product, taxon)
    return false unless taxon.has_available_special_offer?
    taxon.special_offer.tap do |so|
      return "affordable" if  so.affordable_product == product
      return "popular" if so.popular_product == product
      return "best" if so.best_product == product
    end
    return false
  end
end