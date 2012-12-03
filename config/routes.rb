Werdau::Application.routes.draw do
  mount Resque::Server, :at => '/resque-server'
  mount Forem::Engine, :at => "/forums"

  mount Spree::Core::Engine, :at => '/', :as => 'spree'
  root :to => 'spree/home#index'

  Spree::Core::Engine.routes.draw do
    mount Forem::Engine, :at => "/forums", :as => 'forem'

    # Add your extension routes here
    match '/news/:id' => 'news_items#show', :as => :news_item,
      :constraints => { :id => /\d+/ }
    match '/news/:category' => 'news_items#index', :as => :news_item_category

    match '/checkout(.:format)' => 'checkout#edit', :as => :checkout,
      :state => 'contacts'

    match '/bookmarks'     => 'bookmarks#index',  :via => :get,  :as => :bookmarks
    match '/bookmarks/:id' => 'bookmarks#create', :via => :post, :as => :bookmark
    match '/bookmarks/:id' => 'bookmarks#delete', :via => :delete

    match '/products/:product_id/images' => 'product_images#index',
      :as => :product_images

    match '/advertisements/' => 'advertisements#index', :as => :advertisements

    namespace :admin do
      resources :news_items
      resources :advertisements

      resources :special_offers
      resources :special_offer_empty_taxon_bindings
      match "search_taxons" => "taxons#search"
      match "search_products" => "products#search"
      
      resources :products do
        collection do
          get  :import, :to => 'product_import#form'
          post :import, :to => 'product_import#import'
          get  :import_status, :to => 'product_import#import_status'
        end
      end

      scope '/taxons/:taxon_id', :as => 'taxon' do
        resources :product_filters, :only => [:new, :create, :destroy] do
          collection do
            post :rebuild
          end
        end
      end
    end
  end

end
