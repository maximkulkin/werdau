Spree::OrdersController.class_eval do
  respond_to :js, :only => [:edit, :update, :populate]
end
