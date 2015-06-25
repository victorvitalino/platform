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
    #busca o codigo de na tabela de permissões(system_permissions), e verifica se a permissão esta ativa e usuario possui a permissão
    def allow?(code)
      @permission = Person::SystemPermission.find_by_code(code)
      
      if @permission.present?
        user.permissions.where(system_permission_id: @permission.id, status: true).present? 
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