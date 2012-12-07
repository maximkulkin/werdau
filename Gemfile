source 'http://rubygems.org'

gem 'rails', '~> 3.2.0'
gem 'mysql2'

group :development do
  gem 'thin'
  gem 'rails-dev-tweaks', '~> 0.6.1'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.0'
  gem 'coffee-rails', '~> 3.2.0'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer'

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

gem 'slim'

gem 'unicorn'

group :development do
  # Deploy with Capistrano
  gem 'capistrano'
  gem 'rvm-capistrano'
  gem 'capistrano-ext-rvm-unicorn'
end

group :test do
  # Pretty printed test output
  gem 'turn', '~> 0.8.3', :require => false
end

gem 'unicode'
gem 'russian', '~> 0.6.0'
gem 'spree_core', '~> 1.2.0'
gem 'spree_auth_devise', :git => "git://github.com/spree/spree_auth_devise"
gem 'spree_api', '~> 1.2.0'
gem 'spree_i18n', :git => 'git://github.com/maximkulkin/spree_i18n.git'
gem 'spree_static_content', :git => 'git://github.com/spree/spree_static_content.git', :branch => '1-2-stable'
gem 'spree_editor', :git => 'git://raw.github.com/spree/spree_editor.git'
gem 'tinymce-rails', '>= 3.4.9'
gem 'tinymce-rails-langs'

# gem 'mail_chimp', '>=1.3', :git => 'git://github.com/sbeam/spree-mail-chimp.git'
gem 'spree_yandex_market_scraper', :git => 'git://github.com/maximkulkin/spree_yandex_market_scraper.git'

gem 'spree_recently_viewed', :git => 'git://github.com/spree/spree_recently_viewed.git'

gem 'spree_dynamic_sitemaps', :git => 'git://github.com/romul/spree_dynamic_sitemaps.git'

# gem 'forem', :git => 'git://github.com/radar/forem.git'
# gem 'forem-theme-twist', :git => "git://github.com/radar/forem-theme-twist.git"
# gem 'spree_forem', :git => 'git://github.com/johndavid400/spree_forem.git'

gem 'spree_reviews', :git => 'git://github.com/spree/spree_reviews.git'

gem 'sunspot_rails', '~> 2.0.0.pre.120925'
gem 'sunspot_solr',  '~> 2.0.0.pre.120925'
gem 'progress_bar'

gem 'resque'

# development utils
gem 'foreman'
