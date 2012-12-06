Spree::Admin::ProductsController.class_eval do
  def search
    @products = params[:q].blank? ? [] : Spree::Product.where('lower(name) LIKE ?', "%#{params[:q].mb_chars.downcase}%")
  end
end