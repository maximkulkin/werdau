# encoding: utf-8

class Spree::RedirectsController < Spree::BaseController

  layout false

  def index
    redirect_url = root_path

    begin
      case params['page']
      when 'shop.product_details'
        product = Werdau::Redirect.find_product params
        redirect_url = product_path(product) if product.present?
      when 'shop.browse'
        taxon = Werdau::Redirect.find_category params
        redirect_url = nested_taxons_path(taxon.permalink) if taxon.present?
      end

      if params['view'] == 'article' && params['catid'] == '34:articles'
        news_item = Werdau::Redirect.find_news_item params
        redirect_url = news_item_path(news_item) if news_item.present?
      end
    rescue Exception => e
      #... Logging? Or redirect on root_path...
    end

    redirect_to redirect_url, :status => :moved_permanently
    #render :nothing => true  
  end
  
end