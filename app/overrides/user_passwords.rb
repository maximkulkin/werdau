Deface::Override.new(
  :name => 'add_errors',
  :virtual_path => 'spree/user_passwords/new',
  :insert_after => 'h6',
  :text => '<%= devise_error_messages! %>'
)
