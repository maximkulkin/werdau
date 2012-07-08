module Spree
  class ProductImagesController < Spree::BaseController
    rescue_from ActiveRecord::RecordNotFound, :with => :render_404
    respond_to :html

    def index
      @product = Spree::Product.find_by_permalink!(params[:product_id])
      @images = @product.images

      request.xhr? ? render(:layout => false) : render
    end
  end
end
