module BookmarksHelper
  def bookmark_link(variant)
    options = { :class => "bookmark variant-#{variant.id}" }

    return link_to(t(:in_bookmarks), bookmarks_path, options) \
      if current_user.bookmarked_variants.include? variant

    link_to t(:bookmark), bookmark_path(:id => variant),
      options.merge(:method => :post, :remote => true)
  end
end
