require 'spec_helper'

describe RssEntry do
   describe ".package" do
      before do
         @rss_entry = RssEntry.new(name:    "RssEntryName",
                                   content: "RssEntryContent",
                                   url:     "RssEntryURL")
      end

      it { expect(@rss_entry.package).to match(/RssEntryName/) }
      it { expect(@rss_entry.package).to match(/RssEntryContent/) }
      it { expect(@rss_entry.package).to match(/RssEntryURL/) }
   end


end