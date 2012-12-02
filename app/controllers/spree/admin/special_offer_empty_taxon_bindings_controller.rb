class Spree::Admin::SpecialOfferEmptyTaxonBindingsController < Spree::Admin::ResourceController
  def index
    respond_with do |format|
      format.html
    end
  end

  private

  def collection
    Spree::SpecialOfferEmptyTaxonBinding.order('created_at desc')
  end
end