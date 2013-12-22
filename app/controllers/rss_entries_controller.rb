class RssEntriesController < ApplicationController
  def index
     @rss_entries = RssEntry.order("entry_updated_at DESC").load
  end

  def show
     @rss_entry = RssEntry.find(params[:id])
  end

  def package
     rss_entry = RssEntry.find(params[:id])
     fname = "rss_entry_#{rss_entry.id}_#{DateTime.now.to_i}.txt"
     send_data rss_entry.package, type: 'text/text;',
        disposition: "attachment; filename=#{fname}"
  end

  def destroy
     RssEntry.find(params[:id]).destroy
     redirect_to rss_entries_url
  end
end
