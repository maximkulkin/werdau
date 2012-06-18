# encoding: utf-8

module TaxonHelper
  def taxonomy(type)
    case type
    when :categories then Spree::Taxonomy.find_by_name('Категории')
    when :recommendations then Spree::Taxonomy.find_by_name('Рекомендации')
    end
  end

  def taxon_recommend
    Spree::Taxon.find_by_name_and_taxonomy_id('Мы рекомендуем', taxonomy(:recommendations))
  end

  def categories_taxon(product)
    categories = taxonomy(:categories)
    product.taxons.select { |t| t.taxonomy_id == categories.id }.first
  end
end
