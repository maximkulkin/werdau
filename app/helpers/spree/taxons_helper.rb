module Spree::TaxonsHelper
  def in_special_offer_for_taxon?(product, taxon)
    return false unless taxon.has_available_special_offer?
    taxon.special_offer.tap do |so|
      return [so.affordable_product, so.popular_product, so.best_product].include? product
    end
  end
end