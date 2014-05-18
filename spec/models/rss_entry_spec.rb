require 'spec_helper'

describe RssEntry do
   describe ".package" do
      before do
         Project.create(name: "Project1", person_in_charge: "Person1", contact_address: "address",
                        ruby_version: "2.1.2", ruby_type: "CRuby")
         @rss_entry = RssEntry.new(name:    "RssEntryName",
                                   content: "RssEntryContent",
                                   url:     "RssEntryURL")
      end

      it { expect(@rss_entry.package(["Ruby"])).to match(/RssEntryName/) }
      it { expect(@rss_entry.package(["Ruby"])).to match(/RssEntryURL/) }
   end

   describe ".info_type_2_phrase" do
      context "info type is bugfix" do
         before do
            @rss_entry = RssEntry.new(name: "Ruby", info_type: "bugfix")
         end

         it "return a string that includes バグ修正" do
            expect(@rss_entry.info_type_2_phrase).to match(/バグ修正/)
         end
      end

      context "info type is vulnerability" do
         before do
            @rss_entry = RssEntry.new(name: "Ruby", info_type: "vulnerability")
         end

         it "return a string that includes 脆弱性修正" do
            expect(@rss_entry.info_type_2_phrase).to match(/脆弱性修正/)
         end
      end
   end

end
