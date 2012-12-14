class Spree::Admin::ProductsKitsController < Spree::Admin::ResourceController
  def index
    respond_with do |format|
      format.html
    end
  end

  def new
    @object = Spree::ProductsKit.create
    @object.items.build(is_primary: true)
    @object.items.build
  end

  private

  def collection
    Spree::ProductsKit.order('created_at desc')#.include(:products_kit_items)
  end
end