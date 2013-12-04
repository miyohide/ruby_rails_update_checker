class CreateRssEntries < ActiveRecord::Migration
  def change
    create_table :rss_entries do |t|
      t.string :title
      t.string :url
      t.text :contents
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
