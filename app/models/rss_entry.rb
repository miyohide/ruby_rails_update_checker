class RssEntry < ActiveRecord::Base
   acts_as_paranoid

   def package(info_target)
      messages = ""
      Project.all.each do |project|
         if info_target.include?("Ruby")
            if project.ruby_version.present? && project.ruby_type == "CRuby"
               messages += message_template(project)
            end
         elsif info_target.include?("Rails")
            if project.rails_version.present?
               messages += message_template(project)
            end
         elsif info_target.include?("JRuby")
            if project.ruby_version.present? && project.ruby_type == "JRuby"
               messages += message_template(project)
            end
         end
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
