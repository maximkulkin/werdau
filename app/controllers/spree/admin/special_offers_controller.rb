module Spree
  module Admin
    class SpecialOffersController < Spree::Admin::ResourceController
      def index
        respond_with do |format|
          format.html
        end
      end

      private

      def collection
        SpecialOffer.order('created_at desc')
      end
    end
  end
end