# encoding: utf-8

class RenameProductsTaxonomy < ActiveRecord::Migration
  def up
    say 'Renaming categories taxonomy'
    taxonomy = Spree::Taxonomy.find_by_name('Товары')
    taxonomy.name = 'Категории'
    taxonomy.save!

    taxonomy.root.permalink = 'kategorii'
    taxonomy.root.save!

    taxonomy.root.descendants.each do |t|
      t.set_permalink
      t.save!
    end
  end

  def down
    say 'Renaming categories taxonomy'
    taxonomy = Spree::Taxonomy.find_by_name('Категории')
    taxonomy.name = 'Товары'
    taxonomy.save

    taxonomy.root.permalink = 'tovary'
    taxonomy.root.save!

    taxonomy.root.descendants.each do |t|
      t.set_permalink
      t.save!
    end
  end
end
