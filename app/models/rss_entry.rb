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

今回は、#{info_type_2_phrase}

詳細は、下記情報元を参照ください。

【情報元】
　　#{self.url}


EOS
   end

   def info_type_2_phrase
      case info_type
      when "bugfix"
         "#{name.camelize}がバージョンアップしました。\nこのバージョンアップにはバグ修正のみが行われています。"

      when "vulnerability"
         "#{name.camelize}がバージョンアップしました。\nこのバージョンアップには脆弱性修正が含まれています。"
      else
         ""
      end
   end
end
