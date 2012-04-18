Deface::Override.new(
  :name => 'add_icon_to_taxon_form',
  :virtual_path => 'spree/admin/taxons/_form',
  :insert_before => "code[erb-loud]:contains('f.file_field :icon')",
  :text => '<%= image_tag f.object.icon.url if f.object.icon %>'
)
