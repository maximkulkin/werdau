class Spree::Admin::ProductImportController < Spree::Admin::BaseController
  def form
    render
  end
  
  def import
    filename = params[:data].original_filename
    Werdau::CsvProductImporter.import(params[:data].tempfile)

    flash[:notice] = I18n.t('product_import_result.success', :filename => filename)
    redirect_to admin_products_path
  rescue Exception => e
    @error_message = I18n.t('product_import_result.failure', :filename => filename, :message => e.to_s)
    render 'form'
  end
end
