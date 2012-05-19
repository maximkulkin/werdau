Deface::Override.new(
  :virtual_path => 'spree/shared/_filters',
  :name => 'filters_title',
  :insert_after => 'code[erb-silent]:contains("params[:search] ||= {}")',
  :text => "<div class='title'><span><span><%= t(:filters) %></span></span></h6>"
)

