class ChangeColumnTypeToRssEntries < ActiveRecord::Migration
  def change
     change_column :rss_entries, :entry_updated_at, :datetime
  end
end
