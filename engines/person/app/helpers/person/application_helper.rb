module Person
  module ApplicationHelper
    def link_permission_to(user_id, user_permission_id)
      @permissions = Person::UserPermission.where(system_permission_id: user_permission_id, user_id: user_id, status: true)

      if @permissions.present?
        link_to "", user_user_permission_disable_path(:user_id => user_id, :user_permission_id => user_permission_id), title: 'Desativar', 'data-toggle' => 'tooltip', remote: true, class: 'md-close btn btn-danger waves-effect waves-button waves-float'
      else
        link_to "", user_user_permission_enable_path(:user_id => user_id, :user_permission_id => user_permission_id), title: 'Ativar', 'data-toggle' => 'tooltip',  remote: true, class: 'md-check btn btn-success waves-effect waves-button waves-float'
      end
    end

    def link_status_to(staff_id)
      @staff = Staff.find(staff_id)

      if @staff.status
        link_to "", staff_disable_path(:staff_id => staff_id), title: 'Desativar', 'data-toggle' => 'tooltip', remote: true, class: 'md-close btn btn-danger waves-effect waves-button waves-float'
      else
        link_to "", staff_enable_path(:staff_id => staff_id), title: 'Ativar', 'data-toggle' => 'tooltip',  remote: true, class: 'md-check btn btn-success waves-effect waves-button waves-float'
      end
    end
  end
end
