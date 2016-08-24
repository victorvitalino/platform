require_dependency "candidate/application_controller"

module Candidate
  class EnterpriseCadastresController < ApplicationController

    before_action :set_enterprise_cadastre, only: [:show, :edit, :update, :destroy]

    has_scope :name_candidate
    has_scope :by_cpf
    has_scope :by_enterprise
    has_scope :status
    has_scope :indication_date
    has_scope :by_allotment

    # GET /inheritors
    def index
      #authorize :enterprise_cadastre, :index?
      @enterprise_cadastres = EnterpriseCadastre.all
      @enterprise_cadastres = apply_scopes(@enterprise_cadastres).paginate(:page => params[:page], :per_page => 50)
    end

    # GET /inheritors/1
    def show
      #authorize :enterprise_cadastre, :index?
    end

    # GET /inheritors/new
    def new
      #authorize :enterprise_cadastre, :create?
      @enterprise_cadastre = EnterpriseCadastre.new
    end

    # GET /inheritors/1/edit
    def edit
      #authorize :enterprise_cadastre, :update?
    end

    # POST /inheritors
    def create
      #authorize :enterprise_cadastre, :create?
      @enterprise_cadastre = EnterpriseCadastre.new(enterprise_cadastre_params)

      if @enterprise_cadastre.save
        redirect_to enterprise_cadastre_path

      else
        render :new
      end
    end

    # PATCH/PUT /inheritors/1
    def update
      #authorize :enterprise_cadastre, :update?
      if @enterprise_cadastre.update(enterprise_cadastre_params)
        redirect_to enterprise_cadastres_path
      else
        render :edit
      end
    end

    # DELETE /inheritors/1
    def destroy
      #authorize :enterprise_cadastre, :destroy?
      @enterprise_cadastre.destroy
      redirect_to enterprise_cadastres_path
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_enterprise_cadastre
        @enterprise_cadastre = EnterpriseCadastre.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def enterprise_cadastre_params
        params.require(:enterprise_cadastre).permit(:inactive_date, :inactive, :source_list, :zone)
      end
  end
end
