class CreateSpreeImportStatuses < ActiveRecord::Migration
  def change
    create_table :spree_import_statuses do |t|
      t.integer :count_all, :default => 0
      t.integer :count_process, :default => 0
      t.boolean :active, :default => false
      
      t.text :error_messages

      t.timestamps
    end

    add_index :spree_import_statuses, [:active]
  end
end
