require_dependency 'entity_portal/application_controller'

module EntityPortal
  class CadastresController < ApplicationController 
    has_scope :situation

    def index
      @entities = apply_scopes(Entity::Cadastre).all.order(:name).paginate(:page => params[:page], :per_page => 20)
    end

    def show
      @entity = Entity::Cadastre.find(params[:id])
      @candidates = Candidate::View::GeneralPontuation.where(id: @entity.candidate.map(&:id).to_a, situation_status_id: 2)
    end

    def new
      session[:entity_id] = nil
      @cadastre = Entity::Cadastre.new
    end

    def create
      @cadastre = Entity::Cadastre.new(set_params)
      
      if @cadastre.save
        session[:entity_id] = @cadastre.id
        redirect_to action: 'success'
      else
        render action: 'new'
      end
    end

    def success
      if session[:entity_id].present?
        @cadastre = Entity::Cadastre.find(session[:entity_id])
      else
        redirect_to action: 'new'
      end
    end

    private

    def set_params
      params.require(:cadastre).permit(:cnpj, :name, :fantasy_name, :telephone, :telephone_optional,
                                       :celphone, :password, :password_confirmation, :city_id, :cep, 
                                       :address, :complement, :number, :email)
    end

  end
end