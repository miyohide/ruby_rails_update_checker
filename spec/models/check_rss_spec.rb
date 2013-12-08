require 'spec_helper'

describe CheckRss do
   describe ".perform" do
      context 'RssEntryにデータがないとき' do
         before do
            CheckRss.perform
         end

         it { expect(RssEntry.count).to be > 0 }
      end
   end

end
