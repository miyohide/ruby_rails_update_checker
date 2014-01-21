class RssEntry < ActiveRecord::Base
   acts_as_paranoid

   def package
      return <<"EOS"
#{self.name.camelize}に関する情報をお知らせします。

#{self.content}

詳細は、下記情報元を参照ください。

【情報元】
　　#{self.url}
EOS
   end
end
