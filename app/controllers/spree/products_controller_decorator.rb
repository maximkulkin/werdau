Spree::ProductsController.class_eval do
  def index
    @searcher = Spree::Config.searcher_class.new(params)
    @products = @searcher.retrieve_products

    if request.xhr?
      render :partial => 'spree/shared/product', :collection => @products 
    else
      respond_with(@products)
    end
  end
end
