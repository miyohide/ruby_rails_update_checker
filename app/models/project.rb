class Project < ActiveRecord::Base
   validates :name, presence: true
   validates :person_in_charge, presence: true
   validates :contact_address, presence: true
end
