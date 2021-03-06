require 'yaml'

module Shared
  module NavHelper
   
    def nav_link_to(system_module)

      file = YAML.load_file(File.join(Rails.root,"components/shared/lib/files/navs/#{system_module}.yml")) rescue nil
      
      if file.present? && view_nav?(file['nav'][system_module])
        
        @html = <<-HTML
          <li class="dropdown #{(params[:module] == file['nav'][system_module]['info']['module']) ? 'has-active has-sub' : 'has-sub'}">
            <a aria-expanded="true" aria-haspopup="true" class="dropdown-toggle" data-toggle="dropdown" href="#" role="button">
              #{file["nav"]["#{system_module}"]["info"]["label"]}
              <span class="caret"></span>
            </a>
            <ul class='dropdown-menu'> 
        HTML

        if file["nav"]["#{system_module}"]["modules"].present?
          
          file["nav"]["#{system_module}"]["modules"].each do |nav|
            
            if allow_nav?(nav[1]['code'])
              @html += <<-HTML
                <li class='dropdown dropdown-submenu'>
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    #{nav[1]['label']} 
                  </a>
              HTML

              if nav[1]['sub'].count > 0
                @html += "<ul class='dropdown-menu'>"

                nav[1]['sub'].each do |sub|
                  if allow_nav?(sub[1]['code'])
                    @html += <<-HTML
                        <li class='site-menu-item'>
                          <a class='animsition-link' href="#{send(sub[1]['module']).url_for(controller: sub[1]['controller'], action: sub[1]['action'] )}">
                            <span class='site-menu-title'>#{sub[1]['label']}</span>
                          </a>
                        </li>
                    HTML
                  end
                end

                @html += "</ul>"
              end
            end
          end
        end

        @html += "</li></ul></li>"
        @html.html_safe
        
      end
    end

    private

    def view_nav?(system)
      return true if system['info']['code'] == 0 || current_user.administrator

      code = system['info']['code']
      system_module = Person::SystemModule.find_by_code(code) rescue nil 
      
      return false unless system_module.present? && system_module.systems.present?

      permissions   = Person::SystemPermission.where(system_id: system_module.systems.map(&:id))
      (current_user.permissions.map(&:system_permission_id) & permissions.map(&:id)).present?
      
    end

    def allow_nav?(code)
      return true if current_user.administrator?
      permissions = Person::SystemPermission.where(code: code)
      (current_user.permissions.map(&:system_permission_id) & permissions.map(&:id)).present?
    end
  end
end

    
