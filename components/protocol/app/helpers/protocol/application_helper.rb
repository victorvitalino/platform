module Protocol
  module ApplicationHelper

    def flash_message
      messages = ""
      [:notice, :info, :warning, :error].each {|type|
        if flash[type]
          messages += "<p class=\"alert alert-#{type}\">#{flash[type]}</p>"
        end
      }

      messages
   end

   def link_validate_to(solicitation)
     solic = Protocol::Solicitation.find(solicitation)
     if solic.present?
       unless solic.authenticate_id.present?
         link_to "",solicitation_validate_path(solic.id),title: "validar", class: 'glyphicon glyphicon-ok btn-xs btn btn-warning'
       end
     end
   end

  end
end
