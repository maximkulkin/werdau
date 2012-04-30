Deface::Override.new(
  :name => 'change_add_to_cart_button_title',
  :virtual_path => 'spree/products/_cart_form',
  :replace => 'code[erb-loud]:contains("t(:add_to_cart)")',
  :text => "<%= t(:purchase) %>"
)

Deface::Override.new(
  :name => 'remove_checkout_progress',
  :virtual_path => 'spree/checkout/edit',
  :remove => 'div[data-hook="checkout_progress"]'
)

