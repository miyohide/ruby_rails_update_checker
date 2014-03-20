class RssEntry < ActiveRecord::Base
   acts_as_paranoid

   def package
      messages = ""
      Project.all.each do |project|
         messages += message_template(project)
      end
      messages
   end

   def message_template(project)
      return <<"EOS"
-----------------------------------------------------
to: #{project.contact_address}

#{project.person_in_charge}さま

#{self.name.camelize}に関する情報をお知らせします。

#{self.content}

詳細は、下記情報元を参照ください。

【情報元】
　　#{self.url}


EOS
   end
end
