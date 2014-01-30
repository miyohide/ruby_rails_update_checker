class Settings::CheckRssesController < ApplicationController
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

   def edit
      @rss_url = Settings.unscoped.find(params[:id])
      @key = params[:key]
      @val = @rss_url.value[@key]
   end

   def update
      update_rss_url = Hash[*[params[:rss_name], params[:rss_url]]]
      Settings.rss_urls = Settings.rss_urls.merge!(update_rss_url)
      redirect_to action: :index
   end

   def destroy
      rss_urls = Settings.rss_urls
      rss_urls.delete(params[:key])
      Settings.rss_urls = rss_urls
      redirect_to action: :index
   end
end

