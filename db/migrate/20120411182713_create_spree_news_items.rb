class CreateSpreeNewsItems < ActiveRecord::Migration
  def change
    create_table :spree_news_items do |t|
      t.integer :category_id
      t.string  :title
      t.text    :contents
      t.string  :image_file_name

      t.date    :active_from
      t.date    :active_till
    end
  end
end
