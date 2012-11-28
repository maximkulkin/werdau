class AddColumnCountErrorsInSpreeImportStatuses < ActiveRecord::Migration
  def self.up
    add_column :spree_import_statuses, :count_errors, :integer, :default => 0
  end

  def self.down
    remove_column :spree_import_statuses, :count_errors
  end
end
