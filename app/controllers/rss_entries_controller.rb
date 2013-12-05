class RssEntriesController < ApplicationController
  def index
     @rails_entries = RssEntry.rails_rss
  end

  def show
  end

  def destroy
  end
end
