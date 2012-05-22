# encoding: utf-8

module Werdau
  class CsvProductImporter
    def self.import(file)
      taxonomy = Spree::Taxonomy.find_by_name('Категории')

      path2taxon = {}
      taxonomy.taxons.each do |taxon|
        path = taxon.self_and_ancestors[1..-1].map(&:name).join('/')
        path2taxon[path] = taxon
      end

      file.gets # skip header line

      file.each do |line|
        line.force_encoding('UTF-8')
        line.gsub!(/^~/, '')
        line.gsub!(/~$/, '')

        sku, name, path, price, active, tag = line.split('~^~')

        variant = Spree::Variant.where(sku: sku).includes(:product).first
        product = variant ? variant.product : Spree::Product.create(name: name, price: price)

        product.name = name
        product.price = price
        product.available_on = (active == 'Y') ? Date.today : nil
        product.save!

        taxon = path2taxon[path]
        if taxon
          new_product_taxons = product.taxons.reject { |t| t.taxonomy_id == taxonomy.id }
          new_product_taxons << taxon

          product.taxons.replace new_product_taxons
        end
      end

    end
  end
end

