
Spree::Taxon.class_eval do
  attachment_definitions[:icon][:styles] = { :normal => '64x64>' }
  attachment_definitions[:icon][:default_style] = :normal
end

