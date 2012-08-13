class Spree::Admin::AdvertisementsController < Spree::Admin::ResourceController
  def index
    respond_with do |format|
      format.html
    end
  end

  private

  def collection
    Spree::Advertisement.order('created_at desc')
  end
end