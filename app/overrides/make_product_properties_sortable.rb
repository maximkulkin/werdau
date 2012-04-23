Deface::Override.new(
  :name => 'make_table_sortable',
  :virtual_path => 'spree/admin/product_properties/index',
  :add_to_attributes => 'table[class=index]',
  :attributes => { 'class' => 'client-sortable' }
)

Deface::Override.new(
  :name => 'add_sortable_handle',
  :virtual_path => 'spree/admin/product_properties/_product_property_fields',
  :insert_top => 'td.property_name',
  :text => "<span class='handle' /><%= f.hidden_field :position %>"
)

