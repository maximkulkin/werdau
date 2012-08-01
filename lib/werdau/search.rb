module Werdau
  class Search
    attr_reader :params, :taxon, :keywords, :order, :order_direction, :per_page, :page

    def initialize(params)
      @params = params
      @taxon = Spree::Taxon.find(params[:taxon]) unless params[:taxon].blank?
      @keywords = params[:keywords]

      @order = ['name', 'price', 'rating'].include?(params[:order]) ? params[:order] : :name
      @order_direction = ['asc', 'desc'].include?(params[:direction]) ? params[:direction] : :asc
      
      @page = [params[:page].to_i, 1].max
      @per_page = params[:per_page].to_i
      @per_page = Spree::Config[:products_per_page] if @per_page <= 0
    end

    def retrieve_products
      result.results
    end

    def result
      searcher = self
      @result ||= Spree::Product.solr_search do
        if searcher.taxon
          with :taxon_ids, searcher.taxon.id
          searcher.taxon.product_filters.each do |filter|
            filter.apply(self, searcher.params)
          end
        end

        fulltext searcher.keywords
        paginate :page => searcher.page, :per_page => searcher.per_page

        order_by(searcher.order, searcher.order_direction) if searcher.order
      end
    end
  end
end
