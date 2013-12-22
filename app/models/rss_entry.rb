class RssEntry < ActiveRecord::Base
   acts_as_paranoid

   def package
      self.content
   end
end
