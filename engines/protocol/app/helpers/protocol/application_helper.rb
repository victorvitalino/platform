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

  end
end
