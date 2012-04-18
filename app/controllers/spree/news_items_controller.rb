class Spree::NewsItemsController < Spree::BaseController
  def index
    @category = Spree::NewsItem::Category.find_by_permalink(params[:category])
    @news_items = Spree::NewsItem.active
    @news_items = @news_items.from_category(@category) if @category
  end

  def show
    @news_item = Spree::NewsItem.active.find(params[:id])
  end
end
