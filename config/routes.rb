RubyRailsUpdateChecker::Application.routes.draw do
   resources :rss_entries, only: [:index, :show, :destroy] do
      member do
         get 'package'
      end
   end

   namespace :settings do
      resources :check_rsses
      resources :send_addresses
   end

   root to: 'rss_entries#index'
end
