Spree::UserSessionsController.class_eval do
  respond_to :js, :only => [:new, :create]

  def create
    authenticate_user!

    if user_signed_in?
      respond_to do |format|
        format.html {
          flash.notice = t(:logged_in_successfully)
          redirect_back_or_default(products_path)
        }
        format.js
      end
    else
      flash.now[:error] = t('devise.failure.invalid')
      render :new
    end
  end
end
