class Spree::Admin::NewsItemsController < Spree::Admin::ResourceController
  def index
    respond_with do |format|
      format.html
    end
  end

  private

  def collection
    Spree::NewsItem.order('created_at desc')
  end
end
