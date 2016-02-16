module Protocol
  class ApplicationPolicy
    attr_reader :user, :record

    def initialize(user, record)
      @user = user
      @record = record
    end

    def view_nav?
      return true if user.account.administrator
      system_module = Person::SystemModule.find_by_code('31') rescue nil
      permissions   = Person::SystemPermission.where(system_id: system_module.systems.map(&:id))
      (user.account.privilege_id & permissions.map(&:code)).present?
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
      user.account.privilege_id.to_a.include? code.to_i
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
