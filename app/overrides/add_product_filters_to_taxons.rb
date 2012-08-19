Deface::Override.new(
  :name => 'add_product_filters',
  :virtual_path => 'spree/admin/taxons/edit',
  :insert_before => '[data-hook="buttons"]',
  :text => '<%= render :partial => "spree/admin/product_filters/index", :locals => { :taxon => @taxon, :f => f } %>'
)
