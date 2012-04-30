# encoding: utf-8

[
  ['about', 'О нас'],
  ['shipping', 'Доставка'],
  ['contacts', 'Контакты'],
  ['payments', 'Оплата'],
  ['warranty', 'Гарантии']
].each do |slug, title|
  next if Spree::Page.exists?(:slug => slug)
  Spree::Page.create!(:slug => slug, :title => title, :body => title, :visible => true)
end

admin_role = Spree::Role.find_or_create_by_name('admin')

ADMIN_EMAIL = 'spree@example.com'
ADMIN_PASSWORD = 'spree123'

Spree::User.create!({
  :login => ADMIN_EMAIL,
  :email => ADMIN_EMAIL,
  :password => ADMIN_PASSWORD,
  :password_confirmation => ADMIN_PASSWORD,
  :role => admin_role
}) unless Spree::User.exists?(:login => ADMIN_EMAIL)

unless Spree::Country.exists?(:id => 168)
  russia = Spree::Country.new({
    :name => 'Россия',
    :iso3 => 'RUS',
    :iso => 'RU',
    :iso_name => 'RUSSIAN FEDERATION',
    :numcode => '643'
  })
  russia.id = 168
  russia.save!
end

saratov_region = Spree::Zone.find_or_create_by_name('Саратовская область')

Spree::PaymentMethod.create!({
  :type => 'Spree::ShippingMethod::Check',
  :name => 'Наложенный платеж',
  :environment => RAILS_ENV,
  :display_on => 'both'
}) unless Spree::PaymentMethod.exists?(:name => 'Наложенный платеж')

Spree::ShippingMethod.create!({
  :name => 'Курьерская доставка',
  :zone => saratov_region,
  :calculator_type => 'Spree::Calculator::FlatRate',
  :display_on => 'both'
}) unless Spree::ShippingMethod.exists?(:name => 'Курьерская доставка')

