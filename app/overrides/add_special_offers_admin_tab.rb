Deface::Override.new(
  :name => 'spree_special_offers_admin_tab',
  :virtual_path => 'spree/layouts/admin',
  :insert_bottom => '[data-hook="admin_tabs"]',
  :text => '<%= tab(:special_offers) %>'
)