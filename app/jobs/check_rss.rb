module CheckRss
   @queue = :check_rss_queue
   def self.perform
      rails_rss = Feedzirra::Feed.fetch_and_parse('http://weblog.rubyonrails.org/feed/atom.xml')
      max_rss_updated_at = RssEntry.with_deleted.maximum(:entry_updated_at)
      rails_rss.entries.each do |entry|
         if max_rss_updated_at.nil? || entry.updated.to_datetime > max_rss_updated_at
            RssEntry.create(
               title: entry.title,
               content: entry.content.gsub(/<.+?>/m, ''),
               entry_updated_at: entry.updated.to_datetime
            )
         end
      end
   end
end
