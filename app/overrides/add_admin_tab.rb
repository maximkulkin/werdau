Deface::Override.new(
  :name => 'spree_news_admin_tab',
  :virtual_path => 'spree/layouts/admin',
  :insert_bottom => '[data-hook="admin_tabs"]',
  :text => '<%= tab(:news_items) %>'
)
