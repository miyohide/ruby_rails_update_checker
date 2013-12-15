class AddNameToRssEntries < ActiveRecord::Migration
  def change
    add_column :rss_entries, :name, :string
  end
end
