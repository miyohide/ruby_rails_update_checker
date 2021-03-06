class RssEntriesController < ApplicationController
  def index
     @rss_entries = RssEntry.order("entry_updated_at DESC").load
  end

  def show
     @rss_entry = RssEntry.find(params[:id])
  end

  def package
     rss_entry = RssEntry.find(params[:id])
     rss_entry.info_type = params[:rss_entry][:info_type]
     rss_entry.save!
     fname = "rss_entry_#{rss_entry.id}_#{DateTime.now.to_i}.txt"
     send_data rss_entry.package(params[:info_target]), type: 'text/text;',
        disposition: "attachment; filename=#{fname}"
  end

  def rss_update
     CheckRss.perform
     redirect_to rss_entries_url
  end

  def destroy
     RssEntry.find(params[:id]).destroy
     redirect_to rss_entries_url
  end
end
