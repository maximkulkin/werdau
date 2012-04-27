Spree::Image.class_eval do
  attachment_definitions[:attachment][:convert_options] ||= {}
  attachment_definitions[:attachment][:convert_options][:product] = "-background white -gravity center -extent 240x240"
end

