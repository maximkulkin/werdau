class Spree::Admin::SpecialOffersController < Spree::Admin::ResourceController
  def index
    respond_with do |format|
      format.html
    end
  end

  private

  def collection
    Spree::SpecialOffer.order('created_at desc')
  end
end