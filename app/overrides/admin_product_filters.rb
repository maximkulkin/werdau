# encoding: utf-8
Deface::Override.new(
  :name => 'add_controls_to_search_products_with_no_images',
  :virtual_path => 'spree/admin/products/index',
  :insert_bottom => '[data-hook="admin_products_index_search"]',
  :text => '
  <p>
    <%= f.check_box :images_count_eq, {:checked => !params[:q][:images_count_eq].blank?}, "0", "" %>
    <%= f.label :images_count_eq, t(".with_no_images") %>
  </p>
  '
)

Deface::Override.new(
  :name => 'add_controls_to_search_products_with_no_properties',
  :virtual_path => 'spree/admin/products/index',
  :insert_bottom => '[data-hook="admin_products_index_search"]',
  :text => '
  <p>
    <%= f.check_box :properties_count_eq, {:checked => !params[:q][:properties_count_eq].blank?}, "0", "" %>
    <%= f.label :properties_count_eq, t(".with_no_properties") %>
  </p>
  '
)

Deface::Override.new(
  :name => 'add_controls_to_search_products_with_no_taxons',
  :virtual_path => 'spree/admin/products/index',
  :insert_bottom => '[data-hook="admin_products_index_search"]',
  :text => '
  <p>
    <%= f.check_box :taxons_count_eq, {:checked => !params[:q][:taxons_count_eq].blank?}, "0", "" %>
    <%= f.label :taxons_count_eq, t(".with_no_taxons") %>
  </p>
  '
)
