module FirmPortal
  module ApplicationHelper

    def link_contact_to(cadastre_id, enterprise_cadastre_id,status_id)

      if status_id.present?
          link_to "<i class='glyphicon glyphicon-earphone' ></i>".html_safe, "#", title: "Contactado", 'data-toggle' => 'tooltip', class: " btn btn-success"
      else
          link_to "<i class='glyphicon glyphicon-ok' ></i>".html_safe, enable_enterprise_cadastres_path(:cadastre_id => cadastre_id, :enterprise_cadastre_id => enterprise_cadastre_id), title: "Contactar", 'data-toggle' => 'tooltip', remote: true, class: " btn btn-info"
      end
    end

  end
end
