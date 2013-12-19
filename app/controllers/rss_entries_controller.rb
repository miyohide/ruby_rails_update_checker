class RssEntriesController < ApplicationController
  def index
     @rss_entries = RssEntry.order("entry_updated_at DESC").load
  end

  def show
     @rss_entry = RssEntry.find(params[:id])
  end

  def destroy
     RssEntry.find(params[:id]).destroy
     redirect_to rss_entries_url
  end
end
