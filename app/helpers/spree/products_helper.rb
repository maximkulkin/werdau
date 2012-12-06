module Spree::ProductsHelper
  include TaxonsHelper

  def in_special_offer_for_search_result?(product, taxons_in_search_result)
    taxons_in_search_result.each do |taxon|
      return true if in_special_offer_for_taxon?(product, taxon)
    end
    return false
  end
end