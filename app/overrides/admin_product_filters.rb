# encoding: utf-8
Deface::Override.new(
  :name => 'add_controls_to_search_products_with_no_images',
  :virtual_path => 'spree/admin/products/index',
  :insert_bottom => '[data-hook="admin_products_index_search"]',
  :text => '
  <p>
    <%= f.check_box :with_no_images, {:checked => !params[:search][:with_no_images].blank?}, "1", "" %>
    <%= f.label :with_no_images, t(".with_no_images") %>
  </p>
  '
)

Deface::Override.new(
  :name => 'add_controls_to_search_products_with_no_properties',
  :virtual_path => 'spree/admin/products/index',
  :insert_bottom => '[data-hook="admin_products_index_search"]',
  :text => '
  <p>
    <%= f.check_box :with_no_properties, {:checked => !params[:search][:with_no_properties].blank?}, "1", "" %>
    <%= f.label :with_no_properties, t(".with_no_properties") %>
  </p>
  '
)
