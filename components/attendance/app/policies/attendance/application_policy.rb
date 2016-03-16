module Attendance
  class ApplicationPolicy
    attr_reader :user, :record

    def initialize(user, record)
      @user = user
      @record = record
    end

    def index?
      return true if user.account.administrator
      @system = Person::System.find_by_code('5')#CÓDIGO SISTEMA HELP DESK
        if @system.present?
        return true if user.account.permissions.where(system_id: @system.id, status: true).present?
      end
    end

    def show?
      scope.where(:id => record.id).exists?
    end

    def create?
      false
    end

    def new?
      create?
    end

    def update?
      false
    end

    def edit?
      update?
    end

    def destroy?
      false
    end

    def scope
      Pundit.policy_scope!(user, record.class)
    end
    #VERIFICA SE O USUÁRIO POSSUI O CÓDIGO DA PERMISSÃO
    def allow?(code)
      return true if user.account.administrator?
      permissions = Person::SystemPermission.where(code: code)
      (user.permissions.map(&:system_permission_id) & permissions.map(&:id)).present?
    end

    private
    class Scope
      attr_reader :user, :scope

      def initialize(user, scope)
        @user = user
        @scope = scope
      end

      def resolve
        scope
      end
    end
  end
end
