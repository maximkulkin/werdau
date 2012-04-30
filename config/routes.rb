Werdau::Application.routes.draw do

  mount Spree::Core::Engine, :at => '/'

  Spree::Core::Engine.routes.draw do
    # Add your extension routes here
    match '/news/:id' => 'news_items#show', :as => :news_item,
      :constraints => { :id => /\d+/ }
    match '/news/:category' => 'news_items#index', :as => :news_item_category

    match '/checkout(.:format)' => 'checkout#edit', :as => :checkout,
      :state => 'contacts'

    namespace :admin do
      resources :news_items
    end
  end

end
