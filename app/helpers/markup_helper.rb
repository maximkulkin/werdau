module MarkupHelper
  def section_title(title, options={})
    options[:class] = "#{options[:class]} section"
    content_tag(:h2, content_tag(:span, content_tag(:span, title)), options)
  end
end
