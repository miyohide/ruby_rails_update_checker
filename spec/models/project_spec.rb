require 'spec_helper'

describe Project do
   describe "validations" do
      context "すべての要素が入っている時" do
         before do
            @project = Project.new(name: "proj1",
                                   person_in_charge: "person1",
                                   contact_address: "hoge@example.com")
         end

         it "エラーがないこと" do
            expect(@project).to be_valid
         end
      end

      context "nameに値が入っていない時" do
         before do
            @project = Project.new(person_in_charge: "person1",
                                   contact_address: "hoge@example.com")
         end

         it "nameにエラーがあること" do
            expect(@project).to have(1).errors_on(:name)
         end
      end

      context "person_in_chargeに値が入っていない時" do
         before do
            @project = Project.new(name: "hoge",
                                   contact_address: "hoge@example.com")
         end

         it "person_in_chargeにエラーがあること" do
            expect(@project).to have(1).errors_on(:person_in_charge)
         end
      end

      context "contact_addressに値が入っていない時" do
         before do
            @project = Project.new(name: "proj1",
                                   person_in_charge: "person1")
         end

         it "contact_addressにエラーがあること" do
            expect(@project).to have(1).errors_on(:contact_address)
         end
      end
   end

   describe "#check_ruby_version" do
      describe "2.1系" do
         before do
            @project = Project.new(name: "proj1", person_in_charge: "person1",
                                   contact_address: "address1",
                                   ruby_version: "2.1.1")
         end

         context "2.1.0の場合" do
            it "負の値が返ること" do
               expect(@project.check_ruby_version("2.1.0")).to be < 0
            end
         end

         context "2.1.1の場合" do
            it "0が返ること" do
               expect(@project.check_ruby_version("2.1.1")).to eq 0
            end
         end

         context "2.1.2の場合" do
            it "正の値が返ること" do
               expect(@project.check_ruby_version("2.1.2")).to be > 0
            end
         end
      end

   end
end
