Spree::BaseController.class_eval do
  def unauthorized
    respond_to do |format|
      format.html do
        if current_user
          flash.now[:error] = t(:authorization_failure)
          render 'spree/share/unauthorized', :layout => '/spree/layouts/spree_application'
        else
          store_location
          redirect_to spree.login_path
        end
      end
      format.js do
        if current_user
          render 'spree/share/unauthorized.js'
        else
          store_location
          render 'spree/user_sessions/new.js'
        end
      end
    end
  end
end
