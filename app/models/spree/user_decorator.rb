Spree::User.class_eval do
  has_and_belongs_to_many :bookmarked_variants,
    :class_name => 'Spree::Variant',
    :join_table => 'spree_user_product_bookmarks',
    :uniq => true

  has_many :bookmarked_products, :through => :bookmarked_variants
end
