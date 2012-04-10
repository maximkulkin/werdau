Deface::Override.new(
  :name => 'werdau_header',
  :virtual_path => 'spree/layouts/spree_application',
  :replace => '#header',
  :partial => 'shared/header'
)

Deface::Override.new(
  :name => 'werdau_footer',
  :virtual_path => 'spree/layouts/spree_application',
  :replace => '#footer',
  :partial => 'shared/footer'
)

Deface::Override.new(
  :name => 'werdau_remove_sidebar',
  :virtual_path => 'spree/layouts/spree_application',
  :remove => '#sidebar'
)
