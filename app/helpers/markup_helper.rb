# encoding: utf-8
module MarkupHelper
  def section_title(title, options={})
    options[:class] = "#{options[:class]} section"
    content_tag(:h2, content_tag(:span, content_tag(:span, title)), options)
  end

  def purchase_button_for(product)
    form_for(:order, :url => populate_orders_url, :html => { :class => 'buy' }) do |f|
      concat hidden_field_tag("variants[#{product.master.id}]", 1)
      concat submit_tag('Купить')
    end
  end
end
