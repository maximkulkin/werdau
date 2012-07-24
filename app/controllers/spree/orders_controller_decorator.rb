Spree::OrdersController.class_eval do
  respond_to :js, :only => [:edit, :update, :populate]

  def populate
    @order = current_order(true)
    params[:variants].each do |variant_id, quantity|
      quantity = quantity.to_i
      @order.add_variant(Spree::Variant.find(variant_id), quantity) if quantity > 0
    end if params[:variants]

    @order.update!

    respond_with(@order, :location => cart_path)
  end
end
