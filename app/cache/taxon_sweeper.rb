class TaxonSweeper < ActionController::Caching::Sweeper
  observe Spree::Taxon

  def after_save(taxon)
    expire_fragment('main_product_categories_menu')
  end
end
