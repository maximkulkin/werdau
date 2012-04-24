class AddOriginToAssets < ActiveRecord::Migration
  def change
    add_column :spree_assets, :origin, :string
  end
end
