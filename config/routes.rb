RubyRailsUpdateChecker::Application.routes.draw do
   resources :rss_entries, only: [:index, :show, :destroy] do
      member do
         get 'package'
      end
   end

   resources :settings

   root to: 'rss_entries#index'
end
