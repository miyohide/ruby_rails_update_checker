require 'rss'

module CheckRss
   @queue = :check_rss_queue
   def self.perform
      rails_rss = RSS::Parser.parse('http://weblog.rubyonrails.org/feed/atom.xml')
      max_rss_updated_at = RssEntry.maximum('entry_updated_at')
      rails_rss.items.each do |item|
         if max_rss_updated_at.nil? || item.updated.content > max_rss_updated_at
            RssEntry.create(
               title: item.title.content,
               entry_updated_at: item.updated.content.to_datetime
            )
         end
      end
   end
end
