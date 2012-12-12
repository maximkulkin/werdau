Deface::Override.new(
  :name => 'spree_admin_order_payments_tab',
  :virtual_path => 'spree/admin/shared/_order_tabs',
  :remove => 'li:contains("admin_order_payments_url")'
)

