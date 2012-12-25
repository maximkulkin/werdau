Spree::Product.class_eval do
  reflect_on_association(:product_properties).options[:order] = 'position asc'

  has_many :products_kit_items, :through => :variants

  def to_param
    permalink.present? ? permalink : (permalink_was || name.to_s.to_url.gsub("'", ''))
  end

  ransacker :images_count do |parent|
    variants = Arel::Table.new(:spree_variants)
    assets = Arel::Table.new(:spree_assets)

    sql = \
      variants.where(
            variants[:is_master].eq(true).
        and(variants[:product_id].eq(parent.table[:id]))
      ).join(assets, Arel::Nodes::OuterJoin).on(assets[:viewable_id].eq(variants[:id])).
      where(
            assets[:type].eq('Spree::Image').
        and(assets[:viewable_type].eq('Spree::Variant'))
      ).project(assets[:id].count).
      to_sql

    Arel::SqlLiteral.new("(#{sql})")
  end

  ransacker :properties_count do |parent|
    properties = Arel::Table.new(:spree_product_properties)

    sql = \
      properties.where(properties[:product_id].eq(parent.table[:id])).
      project(properties[:id].count).
      to_sql

    Arel::SqlLiteral.new("(#{sql})")
  end

  ransacker :taxons_count do |parent|
    taxons = Arel::Table.new(:spree_products_taxons)

    sql = \
      taxons.where(taxons[:product_id].eq(parent.table[:id])).
      project(taxons[:taxon_id].count).
      to_sql

    Arel::SqlLiteral.new("(#{sql})")
  end

  def rating
    stars.to_f
  end

  searchable do
    text :name
    string :name, :stored => true
    float :price, :stored => true
    float :rating, :stored => true

    date :available_on
    date :deleted_at

    integer :taxon_ids, :multiple => true

    dynamic_string :"property", :stored => true do
      filters = taxons.collect { |t| t.product_filters }.flatten
      filters.inject({}) do |fields,filter|
        fields.merge(filter.extract_data(self))
      end
    end
  end
end
