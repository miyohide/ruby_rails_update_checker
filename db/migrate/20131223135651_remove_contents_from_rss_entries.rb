class RemoveContentsFromRssEntries < ActiveRecord::Migration
  def change
     remove_column :rss_entries, :contents
  end
end
