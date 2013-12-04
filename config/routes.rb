RubyRailsUpdateChecker::Application.routes.draw do
   resources :rss_entries, only: [:index, :show, :destroy]
end
