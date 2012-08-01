module SortingHelper
  def order_link(title, value, options={})
    value = value.to_s

    active = params[:order] == value || (params[:order].blank? && options[:default])

    order_params = { :order => value, :direction => :asc }
    order_params[:direction] = :desc if active && params[:direction] != 'desc'

    css_class = 'order'
    css_class += ' current ' + ((params[:direction]=='desc') ? 'desc' : 'asc') if active

    link_to title, params.merge(order_params), :class => css_class
  end
end
