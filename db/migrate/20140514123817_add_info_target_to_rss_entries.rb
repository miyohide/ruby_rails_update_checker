class AddInfoTargetToRssEntries < ActiveRecord::Migration
  def change
    add_column :rss_entries, :info_target, :string
  end
end
