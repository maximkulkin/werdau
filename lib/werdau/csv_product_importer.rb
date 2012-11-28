# encoding: utf-8

module Werdau
  class CsvProductImporter

    @queue = :high

    def self.import(file_path)
      file      = File.open(File.realpath(file_path), 'r')
      status    = Spree::ImportStatus.active.last

      taxonomy = Spree::Taxonomy.find_by_name('Категории')

      path2taxon = {}
      taxonomy.taxons.each do |taxon|
        path = taxon.self_and_ancestors[1..-1].map(&:name).join('/')
        path2taxon[path] = taxon
      end

      file.rewind
      file.gets # skip header line

      file.each do |line|
        line.force_encoding('UTF-8')
        line.gsub!(/^~/, '')
        line.gsub!(/~$/, '')

        sku, name, path, price, active, tag = line.split('~^~')

        variant = Spree::Variant.where(sku: sku).includes(:product).first
        product = variant ? variant.product : Spree::Product.create(name: name, price: price, sku: sku)
        
        status.increment!(:count_process)
        
        next unless product

        begin
          product.name = name
          product.price = price
          product.available_on = (active == 'Y') ? Date.today : nil
          product.save!
          
          # For bug with UPCASE letters in the first segment path's which from CSV file:
          if (path)
            tmp = path.split('/')
            tmp[0].capitalize!
            path = tmp.join('/')
          end

          taxon = path2taxon[path]
          if taxon
            new_product_taxons = product.taxons.reject { |t| t.taxonomy_id == taxonomy.id }
            new_product_taxons << taxon

            product.taxons.replace new_product_taxons
          else
            raise "Not found path for the category: #{path}"
          end
        rescue Exception => e
          status.add_error_message "#{File.basename(file_path)}: #{e.to_s}"
          status.increment!(:count_errors)
        end
      end
      
      file.close unless file.closed?
      status.update_attributes(:active => false)
    end

    def self.perform(id, file_path)
      self.import(file_path)
    end
  end
end

