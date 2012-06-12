Spree::Image.class_eval do
  attachment_definitions[:attachment][:styles] = {
    :mini => '65x65>',
    :small => '160x160>',
    :product => '300x300>',
    :large => '600x600>'
  }

  attachment_definitions[:attachment][:convert_options] = {
    :all => "-background white -gravity center",
    :mini => "-extent 65x65",
    :small => "-extent 160x160",
    :product => "-extent 300x300",
    :large => '-extent 600x600'
  }
end

