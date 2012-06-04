class Spree::NewsItemsController < Spree::BaseController
  def index
    @category = Spree::NewsItem::Category.find_by_permalink(params[:category])
    @news_items = Spree::NewsItem.from_category(@category) if @category
  end

  def show
    @news_item = Spree::NewsItem.find(params[:id])
  end
end
