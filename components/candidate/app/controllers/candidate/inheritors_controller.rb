require_dependency "candidate/application_controller"

module Candidate
  class InheritorsController < ApplicationController
    before_action :set_cadastre, only: [:new, :edit]
    before_action :set_inheritor, only: [:show, :edit, :update, :destroy]

    has_scope :name_inheritor
    has_scope :cpf
    has_scope :type_inheritor

    # GET /inheritors
    def index
      authorize :inheritor, :index?
      @inheritors = Inheritor.all
      @inheritors = apply_scopes(@inheritors).paginate(:page => params[:page], :per_page => 20)
    end

    # GET /inheritors/1
    def show
      authorize :inheritor, :index?
    end

    # GET /inheritors/new
    def new
      authorize :inheritor, :create?
      @inheritor = @cadastre.inheritors.new
    end

    # GET /inheritors/1/edit
    def edit
      authorize :inheritor, :update?
    end

    # POST /inheritors
    def create
      authorize :inheritor, :create?
      @inheritor = Inheritor.new(inheritor_params)

      if @inheritor.save
        redirect_to @inheritor

      else
        render :new
      end
    end

    # PATCH/PUT /inheritors/1
    def update
      authorize :inheritor, :update?
      if @inheritor.update(inheritor_params)
        redirect_to @inheritor
      else
        render :edit
      end
    end

    # DELETE /inheritors/1
    def destroy
      authorize :inheritor, :destroy?
      @inheritor.destroy
      redirect_to inheritors_url
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_inheritor
        @inheritor = Inheritor.find(params[:id])
      end

      def set_cadastre
        @cadastre = Candidate::Cadastre.find(params[:cadastre_id])
      end

      # Only allow a trusted parameter "white list" through.
      def inheritor_params
        params.require(:inheritor).permit(:cadastre_id, :name, :inheritor_type_id, :cpf, :rg, :born, :civil_state_id, :gender, :single_name, :percentage, :observation)
      end
  end
end
