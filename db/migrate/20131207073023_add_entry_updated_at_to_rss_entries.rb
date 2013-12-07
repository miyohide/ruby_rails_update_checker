class AddEntryUpdatedAtToRssEntries < ActiveRecord::Migration
  def change
    add_column :rss_entries, :entry_updated_at, :time
  end
end
