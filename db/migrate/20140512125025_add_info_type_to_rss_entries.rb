class AddInfoTypeToRssEntries < ActiveRecord::Migration
  def change
    add_column :rss_entries, :info_type, :string
  end
end
