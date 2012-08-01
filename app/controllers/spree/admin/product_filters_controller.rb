class Spree::Admin::ProductFiltersController < Spree::Admin::BaseController
  before_filter :load_taxon

  respond_to :html

  def new
    @product_filter = @taxon.product_filters.build
    respond_with(@product_filter)
  end

  def create
    @product_filter = @taxon.product_filters.build params[:product_filter]
    @product_filter.save
    respond_with(@product_filter, :location => taxon_path)
  end

  def destroy
    @product_filter = @taxon.product_filters.find(params[:id])
    @product_filter.destroy
    respond_with(@product_filter, :location => taxon_path)
  end

  private

  def load_taxon
    @taxon = Spree::Taxon.find(params[:taxon_id])
  end

  def taxon_path
    edit_admin_taxonomy_taxon_path(@taxon.taxonomy, @taxon)
  end
end
