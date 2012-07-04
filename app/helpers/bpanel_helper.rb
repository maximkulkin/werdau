# encoding: utf-8

module BpanelHelper
  def bpanel_tab(title, type, url='#')
    link_to raw("<span class='lc'></span><span class='ic'>#{title}</span><span class='rc'></span>"), url, :class => "tab #{type}"
  end

  def bpanel_account_tab
    bpanel_tab "Личный кабинет", :account, account_path
  end

  def bpanel_compare_tab
    bpanel_tab "К сравнению (0)", :compare
  end

  def bpanel_bookmarks_tab
    count = current_user.bookmarked_variants.count rescue 0
    bpanel_tab "Закладки (#{count})", :bookmarks, bookmarks_path
  end

  def bpanel_viewed_recently_tab
    bpanel_tab "Просмотренные (0)", :viewed_recently
  end

  def bpanel_cart_tab
    bpanel_tab "Корзина (0)", :cart
  end
end

