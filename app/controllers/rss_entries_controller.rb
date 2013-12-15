class RssEntriesController < ApplicationController
  def index
     @rails_entries = RssEntry.order("entry_updated_at DESC").all
  end

  def show
  end

  def destroy
     RssEntry.find(params[:id]).destroy
     redirect_to rss_entries_url
  end
end
