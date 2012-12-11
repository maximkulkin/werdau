# encoding: utf-8

module Werdau
  class Redirect < ActiveRecord::Base

    self.abstract_class = true

    class << self

      def find_product(params)
        return nil if params['product_id'].blank?

        self.on_db :werdau_market do
          res = self.connection.execute("SELECT * FROM jos_vm_product WHERE product_id = #{params['product_id'].to_i}")
          res.each(:as => :hash) do |row|
            variant = Spree::Variant.where(sku: row['product_sku']).includes(:product).first

            return (variant.present? && variant.product.present?) ? variant.product : nil
          end
        end
      end

      def find_category(params)
        return nil if params['category_id'].blank?

        self.on_db :werdau_market do
          res = self.connection.execute("SELECT category_id, category_name FROM jos_vm_category WHERE category_id = #{params['category_id'].to_i}")
          res.each(:as => :hash) do |row|
            return Spree::Taxon.find_by_name(row['category_name'])
          end
        end
      end

      def find_news_item(params)
        return nil if params['id'].blank?

        self.on_db :werdau_market do
          res = self.connection.execute("SELECT title FROM jos_content WHERE id = #{params['id'].to_s.split(':').first.to_i}")
          res.each(:as => :hash) do |row|
            return Spree::NewsItem.find_by_title(row['title'])
          end
        end
      end

    end

  end
end