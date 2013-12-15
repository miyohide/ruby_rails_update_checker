class AddContentToRssEntries < ActiveRecord::Migration
  def change
    add_column :rss_entries, :content, :text
  end
end
