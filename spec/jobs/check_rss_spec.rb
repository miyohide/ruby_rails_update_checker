require 'spec_helper'

describe CheckRss do
   describe '#perform' do
      before do
         CheckRss.perform
      end

      it { expect(RssEntry.where(name: 'rails').count).to be > 0 }
      it { expect(RssEntry.where(name: 'ruby').count).to be > 0 }
   end
end
