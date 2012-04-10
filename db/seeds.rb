# encoding: utf-8

Spree::Core::Engine.load_seed if defined?(Spree::Core)
Spree::Auth::Engine.load_seed if defined?(Spree::Auth)

[ ['about', 'О нас'], ['shipping', 'Доставка'],
  ['promo', 'Акции'], ['contacts', 'Контакты'] ].each do |slug, title|
  Spree::Page.create :slug => slug, :title => title, :body => title, :visible => true
end

