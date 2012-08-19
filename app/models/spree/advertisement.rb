class Spree::Advertisement < ActiveRecord::Base
  has_attached_file :gorizontal_image,
    :styles => { :main_block => '880x218>' },
    :default_style => :main_block,
    :url => '/spree/advertisements/vertical/:id/:style.:extension',
    :path => ':rails_root/public/spree/advertisements/vertical/:id/:style.:extension'
  has_attached_file :vertical_image,
    :styles => { :main_block => '240x400>' },
    :default_style => :main_block,
    :url => '/spree/advertisements/gorizontal/:id/:style.:extension',
    :path => ':rails_root/public/spree/advertisements/gorizontal/:id/:style.:extension'
    
  validates :title, :presence => true

  scope :random, order('RAND()')
end
