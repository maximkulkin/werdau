module MarkupHelper
  def sidebar_title(title, options={})
    content_tag(:h2, content_tag(:span, content_tag(:span, title)), options)
  end
end
