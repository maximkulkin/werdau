module Spree::ProductsHelper
  include TaxonsHelper

  def in_special_offer_for_search_result?(product, taxons_in_search_result)
    taxons_in_search_result.each do |taxon|
    	cls = in_special_offer_for_taxon?(product, taxon)
      return cls if cls
    end
    return false
  end
end