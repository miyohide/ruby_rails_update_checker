require 'rss'

class RssEntry < ActiveRecord::Base
   def self.rails_rss
      RSS::Parser.parse('http://weblog.rubyonrails.org/feed/atom.xml')
   end
end
