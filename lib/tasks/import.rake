# encoding: utf-8

namespace :import do
  task :taxons => :environment do
    # For debugging uncomment following line
    # ActiveRecord::Base.logger = Logger.new(STDOUT)

    taxonomy = Spree::Taxonomy.find_or_create_by_name('Товары')

    taxon_stack = [taxonomy.root]
    level_stack = [-1]

    data = File.open('catalog.txt')
    data.each_line do |line|
      title = line.strip
      level = line.match(/^\s*/)[0].size

      while level_stack.last >= level
        level_stack.pop
        taxon_stack.pop
      end

      parent_taxon = taxon_stack.last

      taxon = Spree::Taxon.find_or_create_by_name_and_parent_id_and_taxonomy_id(title, parent_taxon.id, taxonomy.id)

      if level > level_stack.last
        level_stack.push level
        taxon_stack.push taxon
      end
    end
    data.close

    puts "Data successfully imported"
  end
end
