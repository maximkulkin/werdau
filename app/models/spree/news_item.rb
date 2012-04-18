# encoding: utf-8

class Spree::NewsItem < ActiveRecord::Base
  class Category < Struct.new(:id, :name, :permalink)
    NEWS_INFO  = new(1, 'Новости магазина', 'info')
    PROMO = new(2, 'Акции', 'promo')
    NEWS_TECH = new(3, 'Новости техники', 'tech')
    NEWS_ADVICES = new(3, 'Советы потребителю', 'advices')
    
    

    def to_s
      name
    end

    def to_param
      permalink.to_s
    end

    def self.all
      [NEWS_INFO, PROMO, NEWS_TECH, NEWS_ADVICES]
    end

    def self.find(id)
      all.find { |category| category.id == id }
    end

    def self.find_by_permalink(permalink)
      permalink = permalink.to_s
      all.find { |category| category.permalink == permalink }
    end
  end

  validates :title, :presence => true
  validates :category_id, :presence => true
  validates :active_from, :presence => true
  validates :active_till, :presence => true

  # validates :category_id, :inclusion => { :in => Spree::Config[:news_categories] }
  has_attached_file :image,
    :styles => { :main_block => '880x218>' },
    :default_style => :main_block,
    :url => '/spree/news/:id/:style.:extension',
    :path => ':rails_root/public/spree/news/:id/:style.:extension',
    :default_url => '/assets/default_news_image.png'

  def category
    Category.find(category_id)
  end

  def category=(value)
    self.category_id = value.nil? ? nil : value.id
  end

  def active?
    today = Date.today
    active_from >= today && active_till < today
  end

  scope :active, lambda { where('active_from <= :today and active_till > :today', { :today => Date.today }) }
  scope :from_category, lambda { |category| where('category_id = ?', category.id) }
end

