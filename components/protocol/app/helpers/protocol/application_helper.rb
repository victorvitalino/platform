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

   def link_validate_to(reply_id)
     reply = Protocol::SolicitationReply.find(reply_id)
     if reply.present?
       unless reply.authenticate_id.present?
         link_to "",solicitation_solicitation_reply_validate_path(reply.solicitation_id, reply.id),title: "validar", class: 'glyphicon glyphicon-ok btn-xs btn btn-warning'
       end
     end
   end

  end
end
