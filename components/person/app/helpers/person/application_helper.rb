module Person
  module ApplicationHelper
    def link_permission_to(staff_id, staff_permission_id)

      staff = Person::Staff.find(staff_id) rescue nil
      #array = [ação, titulo da ação, icone da ação, classe de cor do botão] 
      button = (staff.permissions.map(&:system_permission_id).include?(staff_permission_id.to_i)) ? %w(disable desativar remove danger) : %w(enable ativar check success)
    
      link_to "", send("staff_staff_permission_#{button[0]}_path", :staff_id => staff_id, :staff_permission_id => staff_permission_id), title: "#{button[1]}", 'data-toggle' => 'tooltip', remote: true, class: "glyphicon glyphicon-#{button[2]} btn btn-xs btn-#{button[3]} "
    end

    def link_status_to(staff_id, status)
      if status
        link_to "", staff_disable_path(:staff_id => staff_id), title: 'Desativar', 'data-toggle' => 'tooltip', remote: true, class: 'md-close btn btn-danger waves-effect waves-button waves-float'
      else
        link_to "", staff_enable_path(:staff_id => staff_id), title: 'Ativar', 'data-toggle' => 'tooltip',  remote: true, class: 'md-check btn btn-success waves-effect waves-button waves-float'
      end
    end
  end
end
