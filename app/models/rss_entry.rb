class RssEntry < ActiveRecord::Base
   acts_as_paranoid

   def package
      messages = ""
      Settings.send_addresses.each do |address_info|
         messages += message_template(address_info)
      end
      messages
   end

   def message_template(address_info)
      return <<"EOS"
-----------------------------------------------------
#{address_info["name"]}さま

#{self.name.camelize}に関する情報をお知らせします。

#{self.content}

詳細は、下記情報元を参照ください。

【情報元】
　　#{self.url}


EOS
   end
end
