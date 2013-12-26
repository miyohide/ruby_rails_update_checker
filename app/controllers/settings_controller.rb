class SettingsController < ApplicationController
   def index
      @rss_urls = Settings.defaults[:rss_urls]
   end
end
