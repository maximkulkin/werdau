class CustomizeSpreeReviews < ActiveRecord::Migration
  def change
    change_table :spree_reviews do |t|
      t.text :pros
      t.text :cons
      t.integer :usage_period_value
      t.string  :usage_period_unit
    end
  end
end
