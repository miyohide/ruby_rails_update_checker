class Project < ActiveRecord::Base
   validates :name, presence: true
   validates :person_in_charge, presence: true
   validates :contact_address, presence: true

   def check_ruby_version(target_version)
      return 0 if ruby_version == target_version
      target_version_num = Project.version_to_number(target_version)
      self_version_num = Project.version_to_number(self.ruby_version)

      return target_version_num > self_version_num ? 1 : -1

   end

   def self.version_to_number(version)
      version.split(".").each_with_index.
         map { |x, i| x.to_i * 10 ** (1 - i)}.
         inject(0) { |sum, n| sum + n }
   end
end
