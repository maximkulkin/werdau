class Spree::Admin::ProductImportController < Spree::Admin::BaseController
  def form
    render
  end
  
  def import
    Werdau::CsvProductImporter.import(params[:data])

    flash[:notice] = I18n.t('product_import_result.success')
    redirect_to admin_products_path
  rescue Exception => e
    @error_message = I18n.t('product_import_result.failure', :message => e.to_s)
    render 'form'
  end
end
