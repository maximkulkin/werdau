class Spree::Admin::ProductImportController < Spree::Admin::BaseController

  before_filter :find_process_import,  :only => [:form, :import_status]
  
  def form
    render
  end
  
  def import
    filename      = params[:data].original_filename
    filename_full = "tmp/#{filename}"

    File.rename(params[:data].tempfile.path, filename_full)

    file      = File.open(File.realpath(filename_full), 'r')
    lines_all = file.count - 1
    
    Spree::ImportStatus.create!(:active => true, :count_all => lines_all) if lines_all > 0

    Resque.enqueue(Werdau::CsvProductImporter, 1, filename_full)
    
    flash[:notice] = I18n.t('product_import_result.success', :filename => filename)
    redirect_to import_admin_products_path
  rescue Exception => e
    @error_message = I18n.t('product_import_result.failure', :filename => filename, :message => e.to_s)
    render 'form'
  end

  def import_status
    @status.error_messages = JSON.load(@status.error_messages) if @status.present?
    render :json => @status
  end

  protected

  def find_process_import
    @status = Spree::ImportStatus.active.last
  end
end
