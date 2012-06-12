Spree::Image.class_eval do
  attachment_definitions[:attachment][:styles] = {
    :mini => '65x65>',
    :small => '160x160>',
    :product => '300x300>',
    :large => '600x600>'
  }

  attachment_definitions[:attachment][:convert_options] = {
    :mini => "-background white -gravity center -extent 65x65",
    :small => "-background white -gravity center -extent 160x160",
    :product => "-background white -gravity center -extent 300x300",
    :large => '-background white -gravity center -extent 600x600'
  }
end

