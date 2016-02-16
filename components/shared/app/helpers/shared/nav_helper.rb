require 'yaml'

module Shared
  module NavHelper
   
    def nav_link_to(system_module)
      file = YAML.load_file(File.join(Rails.root,"components/shared/lib/files/navs/#{system_module}.yml")) rescue nil
      
      if file.present? && view_nav?(file['nav'][system_module])
        
        @html = <<-HTML
          <li class='site-menu-category'>MENU</li>
          <li class='site-menu-item has-sub'>
            <a data-dropdown-toggle=false, href="#{file['nav'][system_module]['info']['link']}">
              <i class="site-menu-icon #{file['nav'][system_module]['info']['icon']}"></i>
              <span class="site-menu-title">#{file["nav"]["#{system_module}"]["info"]["label"]}</span>
            </a>
            <ul class='site-menu-sub'>
        HTML

        if file["nav"]["#{system_module}"]["modules"].present?
          file["nav"]["#{system_module}"]["modules"].each do |nav|
            
            if allow_nav?(nav[1]['code'])
              @html += <<-HTML
                <li class='site-menu-item has-sub'>
                  <a href= 'javascript:void(0)'>
                    <span class='site-menu-title'> #{nav[1]['label']} </span>
                    <span class="site-menu-arrow"></span>
                  </a>
              HTML

              if nav[1]['sub'].count > 0
                @html += "<ul class='site-menu-sub'>"

                nav[1]['sub'].each do |sub|
                  @html += <<-HTML
                      <li class='site-menu-item'>
                        <a class='animsition-link' href="#{send(sub[1]['module']).url_for(controller: sub[1]['controller'], action: sub[1]['action'] )}">
                          <span class='site-menu-title'>#{sub[1]['label']}</span>
                        </a>
                      </li>
                  HTML
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
      (current_user.privilege_id & permissions.map(&:code)).present?

    end

    def allow_nav?(code)
      return true if current_user.administrator?
      current_user.privilege_id.to_a.include? code.to_i
    end
  end
end

    
