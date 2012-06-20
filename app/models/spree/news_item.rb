# encoding: utf-8

class Spree::NewsItem < ActiveRecord::Base
  class Category < Struct.new(:id, :name, :permalink)
    NEWS_INFO  = new(1, 'Новости магазина', 'info')
    NEWS_TECH = new(2, 'Новости техники', 'tech')
    NEWS_ADVICES = new(3, 'Советы потребителю', 'advices')
    
    

    def to_s
      name
    end

    def to_param
      permalink.to_s
    end

    def self.all
      [NEWS_INFO, NEWS_TECH, NEWS_ADVICES]
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

  # validates :category_id, :inclusion => { :in => Spree::Config[:news_categories] }
  has_attached_file :image,
    :styles => { :main_block => '250x250>', :preview_block => '75x75' },
    :default_style => :main_block,
    :url => '/spree/news/:id/:style.:extension',
    :path => ':rails_root/public/spree/news/:id/:style.:extension'
    #:default_url => '/assets/default_news_image.png'

  def category
    Category.find(category_id)
  end

  def category=(value)
    self.category_id = value.nil? ? nil : value.id
  end
  
  scope :from_category, lambda { |category| where('category_id = ?', category.id) }
end

