module RatingHelper
  def star_rating(rating)
    rating = [[rating.to_i, 0].max, 5].min
    content_tag(:span, '', :class => "stars ran#{rating.to_i}")
  end
end
