class Spree::Advertisement < ActiveRecord::Base
  has_attached_file :horizontal_image,
    :styles => { :main_block => '880x218>' },
    :default_style => :main_block,
    :url => '/spree/advertisements/horizontal/:id/:style.:extension',
    :path => ':rails_root/public/spree/advertisements/horizontal/:id/:style.:extension'
  has_attached_file :vertical_image,
    :styles => { :main_block => '240x400>' },
    :default_style => :main_block,
    :url => '/spree/advertisements/vertical/:id/:style.:extension',
    :path => ':rails_root/public/spree/advertisements/vertical/:id/:style.:extension'
    
  validates :title, :presence => true

  scope :random, order('RAND()')
end
