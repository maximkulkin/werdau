# encoding: utf-8
Deface::Override.new(
  :name => 'add_forum_tab_to_admin_navigation',
  :virtual_path => 'spree/admin/shared/_tabs',
  :insert_after => 'code[erb-loud]:contains("tab :users")',
  :text => '<%= tab :base, :groups, :members, :forums, :moderators, :categories, :topics, :label => "Форум", :url => forem.admin_root_url %>'
)
