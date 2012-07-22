Spree::ReviewsController.class_eval do
  def index
    @approved_reviews = Spree::Review.approved.for_product(@product).page(params[:page]).per(params[:per_page])
  end

  def new
    @review = Spree::Review.new(:product => @product)
  end

  def create
    params[:review][:rating].sub!(/\s*stars/,'') unless params[:review][:rating].blank?

    @review = Spree::Review.new(params[:review])
    @review.product = @product
    @review.user = current_user if user_signed_in?
    @review.ip_address = request.remote_ip

    if @review.save
      flash[:notice] = t('review_successfully_submitted')
      redirect_to (product_path(@product))
    else
      render :action => "new"
    end
  end

end
