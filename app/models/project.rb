class Project < ActiveRecord::Base
   validates :name, presence: true
   validates :person_in_charge, presence: true
   validates :contact_address, presence: true

   # def check_ruby_version(target_version)
   #    return 0 if ruby_version == target_version
   #    target_version_num = Project.version_to_number(target_version)
   #    self_version_num = Project.version_to_number(self.ruby_version)

   #    return target_version_num > self_version_num ? 1 : -1

   # end

   # def self.version_to_number(version)
   #    version.split(".").each_with_index.
   #       map { |x, i| x.to_i * 10 ** (1 - i)}.
   #       inject(0) { |sum, n| sum + n }
   # end

   def patch_level_compare(target_v)
      target_ruby_v, target_patch_level =
         Project.ruby_version_split(target_v)
      self_ruby_v, self_patch_level =
         Project.ruby_version_split(self.ruby_version)

      if target_ruby_v == self_ruby_v
         if target_patch_level == self_patch_level
            return 0
         elsif target_patch_level > self_patch_level
            return 1
         else
            return -1
         end
      elsif target_ruby_v > self_ruby_v
         return 1
      else
         return -1
      end
   end

   private
   def self.ruby_version_split(v_str)
      vers = v_str.tr("-p",".").split(".").delete_if { |i| i.size == 0 }.map { |i| i.to_i }

      patch_level = vers.pop
      ruby_ver = vers.each_with_index.map { |x, i| x.to_i * 10 ** (5 - i) }.inject { |sum, i| sum + i }

      [ruby_ver, patch_level]
   end
end
