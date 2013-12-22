module CheckRss
   @queue = :check_rss_queue
   def self.perform
      rss_list = { rails: 'http://weblog.rubyonrails.org/feed/atom.xml',
                   ruby:  'https://www.ruby-lang.org/ja/feeds/news.rss' }

      rss_list.keys.each do |name|
         rss_entry_update(name, rss_list[name])
      end
   end

   def rss_entry_update(name, url)
      rss = Feedzirra::Feed.fetch_and_parse(url)
      max_rss_updated_at = RssEntry.with_deleted.where(name: name).maximum(:entry_updated_at)
      rss.entries.each do |entry|
         if max_rss_updated_at.nil? || entry.published.to_datetime > max_rss_updated_at
            RssEntry.create(
               title: entry.title,
               content: (entry.summary || entry.content || '').gsub(/<.+?>/m, ''),
               entry_updated_at: entry.published.to_datetime,
               name: name
            )
         end
      end
   end
   module_function :rss_entry_update
end
