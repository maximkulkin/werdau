class Spree::SpecialOfferEmptyTaxonBinding < ActiveRecord::Base
  belongs_to :empty_taxon, class_name: "Spree::Taxon", foreign_key: "empty_taxon_id"
  belongs_to :special_offer_taxon, class_name: "Spree::Taxon", foreign_key: "special_offer_taxon_id"
end
