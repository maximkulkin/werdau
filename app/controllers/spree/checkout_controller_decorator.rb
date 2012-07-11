Spree::CheckoutController.class_eval do
  respond_to :js, :only => :update
end
