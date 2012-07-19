Spree::UserRegistrationsController.class_eval do
  respond_to :js, :only => [:new, :create]

  def create
    @user = build_resource(params[:user])
    if resource.save
      sign_in(:user, @user)
      respond_with(@user, :location => root_path)
    else
      clean_up_passwords(resource)
      render_with_scope :new
    end
  end
end
