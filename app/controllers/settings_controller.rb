class SettingsController < ApplicationController
   def index
      @rss_urls = Settings.unscoped.where(var: 'rss_urls').first
      # @rss_urls = Settings.rss_urls
   end

   def new
   end

   def create
      input_rss_url = Hash[*[params[:rss_name], params[:rss_url]]]
      Settings.rss_urls = Settings.rss_urls.merge!(input_rss_url)
      redirect_to action: :index
   end
end
