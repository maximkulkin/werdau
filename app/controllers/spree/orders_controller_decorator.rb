module OrdersEditJsResponse
  def edit
    super
    # render :layout => false if request.xhr?
    raise "Foo!"
    render :layout => false
  end
end

Spree::OrdersController.class_eval do
  include OrdersEditJsResponse

  def edit
    @order = current_order(true)
    render :layout => false if request.xhr?
  end
end
