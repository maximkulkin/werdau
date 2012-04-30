class AddContactsToOrder < ActiveRecord::Migration
  def change
    add_column :spree_orders, :name, :string
    add_column :spree_orders, :phone, :string
  end
end
