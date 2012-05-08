Deface::Override.new(
  :virtual_path => 'spree/admin/products/index',
  :name => 'product_import_button',
  :insert_bottom => '[data-hook=toolbar] ul.actions',
  :text => '<li><%= button_link_to t(:import_products), import_admin_products_path, {:icon => :import} %></li>'
)
