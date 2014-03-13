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
end
