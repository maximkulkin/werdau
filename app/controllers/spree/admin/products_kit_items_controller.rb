class Spree::Admin::ProductsKitItemsController < Spree::Admin::ResourceController
  def new
    invoke_callbacks(:new_action, :before)
    @object.products_kit = Spree::ProductsKit.find params[:products_kit_id]
    respond_with(@object) do |format|
      format.html { render :layout => !request.xhr? }
      format.js   { render :layout => false }
    end
  end
end