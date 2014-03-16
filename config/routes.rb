RubyRailsUpdateChecker::Application.routes.draw do
   resources :rss_entries, only: [:index, :show, :destroy] do
      member do
         get 'package'
      end

      collection do
         get 'rss_update'
      end
   end

   resources :projects

   root to: 'rss_entries#index'
end
