module Person
  module ApplicationHelper
    def link_permission_to(user_id, user_permission_id)
      @permissions = Person::UserPermisson.where(system_permission_id: user_permission_id, user_id: user_id, status: true)

      if @permissions.present?
        link_to "", user_user_permission_disable_path(:user_id => user_id, :user_permission_id => user_permission_id), title: 'Desativar', 'data-toggle' => 'tooltip', remote: true, class: 'md-close btn btn-danger waves-effect waves-button waves-float'
      else
        link_to "", user_user_permission_enable_path(:user_id => user_id, :user_permission_id => user_permission_id), title: 'Ativar', 'data-toggle' => 'tooltip',  remote: true, class: 'md-check btn btn-success waves-effect waves-button waves-float'
      end
    end

    def link_status_to(user_id)
      @user = User.find(user_id)

      if @user.status
        link_to "", user_disable_path(:user_id => user_id), title: 'Desativar', 'data-toggle' => 'tooltip', remote: true, class: 'md-close btn btn-danger waves-effect waves-button waves-float'
      else
        link_to "", user_enable_path(:user_id => user_id), title: 'Ativar', 'data-toggle' => 'tooltip',  remote: true, class: 'md-check btn btn-success waves-effect waves-button waves-float'
      end
    end
  end
end
