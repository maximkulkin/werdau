Deface::Override.new(
  :name => 'add_position_field_to_product_property',
  :virtual_path => 'spree/admin/product_properties/_product_property_fields',
  :insert_bottom => 'td.property_name',
  :text => "<%= f.hidden_field :position %>"
)

Deface::Override.new(
  :name => 'make_product_properties_sortable',
  :virtual_path => 'spree/admin/product_properties/index',
  :insert_after => 'code[erb-loud]:contains("javascript_tag do")',
  :text => "$('#product_properties').closest('table').sortable_table();"
)

