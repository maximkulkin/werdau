# encoding: utf-8

module Werdau
  class Redirect < ActiveRecord::Base

    self.abstract_class = true

    SYNCHRONIZED_CATEGORIES = {
      'DVD плееры' => 'DVD-плееры', 'Телевизоры LCD и плазменные панели' => 'LCD-телевизоры', 
      'Аксессуары' => 'Подставки и крепления', 'ОЧКИ 3D' => '3D очки',
      'Плееры' => 'MP3 и мультимедиаплееры', 'Радио' => 'Радиоприемники',
      'Наушники диктофоны микрофоны' => 'Наушники', 'Кофеварки' => 'Кофеварки и кофемашины',
      'Авто TV' => 'Видеорегистраторы', 'Автомагнитолы' => 'Автомобильные магнитолы',
      'Автосабвуферы' => 'АВТОСАБВУФЕРЫ', 'Акустические системы' => 'Автомобильная акустика',
      'Навигаторы' => 'GPS-навигаторы', 'Усилители для авто' => 'Автомобильные усилители',
      'Для стрижки волос' => 'Машинки для стрижки', 'Для укладки волос' => 'стайлеры',
      'Для укладки волос' => 'Фены', 'Бритвы' => 'Электробритвы', 'Весы напольные' => 'Напольные весы',
      'Фотоаппараты' => 'Цифровые фотоаппараты', 'Сумки и рюкзаки для фото' => 'Аксессуары для фото-видеотехники',
      'Варочные панели' => 'Встраиваемые варочные поверхности', 'Духовые шкафы' => 'Встраиваемые духовки',
      'Посудомоечные машины' => 'Встраиваемые Посудомоечные машины', 'Кондиционеры и сплит системы' => 'Кондиционеры',
      'Обогревательные приборы' => 'Обогреватели', 'Мониторы' => 'ЖК-Мониторы',
      'Накопители и карты памяти' => 'Накопители данных', 'Комплекты (клавиатура+мышь)' => 'Клавиатуры и комплекты',
      'Принтеры' => 'Лазерные принтеры', 'Аксессуары для ноутбуков' => 'Планшетные ПК и Аксессуары'
    }

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
            return Spree::Taxon.find_by_name((SYNCHRONIZED_CATEGORIES[row['category_name']]) || row['category_name'])
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