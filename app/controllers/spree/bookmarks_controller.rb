class Spree::BookmarksController < Spree::BaseController
  respond_to :html, :only => :index
  respond_to :js, :except => :index

  before_filter :require_user

  def index
    @variants = current_user.bookmarked_variants
  end

  def create
    @variant = Spree::Variant.find(params[:id])
    current_user.bookmarked_variants << @variant
    respond_with(@variant)
  end

  def delete
    @variant = Spree::Variant.find(params[:id])
    current_user.bookmarked_variants.delete @variant
    respond_with(@variant)
  end

  private

  def require_user
    unauthorized unless current_user
  end
end
