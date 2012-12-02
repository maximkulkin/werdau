module Spree
  module Admin
    TaxonsController.class_eval do
      include TaxonsHelper
      helper_method :taxon_path

      def available_for_special_offer
        @special_offer = load_special_offer
        @taxons = params[:q].blank? ? [] : Taxon.where('lower(name) LIKE ?', "%#{params[:q].mb_chars.downcase}%")
        @taxons.delete_if { |taxon| @special_offer.taxon == taxon }

        respond_with(:admin, @taxons)
      end

      def remove_for_special_offer
        @special_offer = load_special_offer
        @taxon = Taxon.find(params[:id])
        @special_offer.taxon = nil
        @special_offer.save
        @taxons = []

        respond_with(@taxon) { |format| format.js { render_js_for_destroy } }
      end

      def select_for_special_offer
        @special_offer = load_special_offer
        @taxon = Taxon.find(params[:id])
        @special_offer.taxon = @taxon
        @special_offer.save
        @taxons = [@special_offer.taxon]

        respond_with(:admin, @taxons)
      end

      private

      def load_special_offer
        SpecialOffer.find params[:special_offer_id]
      end
    end
  end
end