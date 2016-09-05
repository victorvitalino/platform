require_dependency "candidate/application_controller"

module Candidate
  class EnterpriseCadastreSituationsController < ApplicationController
    before_action :set_enterprise_cadastre
    before_action :set_enterprise_cadastre_situation, only: [ :edit, :update, :destroy]

    # GET /inheritors
    def index
      #authorize :enterprise_cadastre_situation, :index?
      @enterprise_cadastre_situations = @enterprise_cadastre.enterprise_cadastre_situations.all
    end

    # GET /inheritors/1
    def show
      #authorize :enterprise_cadastre_situation, :index?
    end

    # GET /inheritors/new
    def new
      #authorize :enterprise_cadastre_situation, :create?
      @enterprise_cadastre_situation = @enterprise_cadastre.enterprise_cadastre.new
    end

    # GET /inheritors/1/edit
    def edit
      #authorize :enterprise_cadastre_situation, :update?
    end

    # POST /inheritors
    def create
      #authorize :enterprise_cadastre_situation, :create?
      @enterprise_cadastre_situation = EnterpriseCadastreSituation.new(enterprise_situation_status_params)

      if @enterprise_cadastre_situation.save
        redirect_to enterprise_cadastre_situations_path

      else
        render :new
      end
    end

    # PATCH/PUT /inheritors/1
    def update
      #authorize :enterprise_cadastre_situation, :update?
      if @enterprise_cadastre_situation.update(enterprise_cadastre_situation_params)
        redirect_to enterprise_cadastre_situations_path
      else
        render :edit
      end
    end

    # DELETE /inheritors/1
    def destroy
      #authorize :enterprise_cadastre_situation, :destroy?
      @enterprise_cadastre_situation.destroy
      redirect_to enterprise_cadastre_situations_path
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_enterprise_cadastre_situation
        @enterprise_cadastre_situation = @enterprise_cadastre.enterprise_cadastre.find(params[:id])
      end

      def set_enterprise_cadastre
        @enterprise_cadastre = EnterpriseCadastre.find(params[:enterprise_cadastre_id])
      end

      # Only allow a trusted parameter "white list" through.
      def enterprise_cadastre_situation_params
        params.require(:enterprise_cadastre_situation).permit(:observation, :file_path, :firm_user_id)
      end
  end
end
