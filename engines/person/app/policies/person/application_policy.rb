module Person
  class ApplicationPolicy
    attr_reader :user, :record
  
    def initialize(user, record)
      @user = user
      @record = record
    end
   
    def index?
      true
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

    def allow?(code)
      code = user.system_permissions.find_by_code(code)
      if code.present?
        user.permissions.where(system_permission_id: code.id, status: true).present? 
      end
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