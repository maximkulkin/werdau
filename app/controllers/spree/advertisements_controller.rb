class Spree::AdvertisementsController < Spree::BaseController
  def index
    @advertisements = Spree::Advertisement.all
  end
end