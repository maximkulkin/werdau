Spree::Admin::TaxonsController.class_eval do
  def search
    @taxons = params[:q].blank? ? [] : Spree::Taxon.where('lower(name) LIKE ?', "%#{params[:q].mb_chars.downcase}%")
  end
end