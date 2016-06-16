module Action
  class CadastresController < ApplicationController
    before_action :set_cadastre, only: [:show, :edit, :update, :destroy]

    def index
      @cadastres = Action::Cadastre.all
    end

    def show

    end

    # GET /posts/new
    def new
      @cadastre = Cadastre.new
    end

    # GET /posts/1/edit
    def edit

    end

    # POST /posts
    def create
      @cadastre = Cadastre.new(cadastre_params)
      if @cadastre.save
        redirect_to action: 'index'
      else
        render :new
      end
    end

    # PATCH/PUT /posts/1
    def update
      if @cadastre.update(cadastre_params)
        redirect_to action: 'index'
      else
        render :edit
      end
    end

    # DELETE /posts/1
    def destroy
      @cadastre.destroy
      redirect_to cadastres_url, notice: 'Post was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_cadastre
        @cadastre = Action::Cadastre.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def cadastre_params
        params.require(:cadastre).permit(:name, :cpf, :profession_id, :formation_area_id, :atuation_area_id, :email, :password, :address, :nationality, :phone, :born, :city_id, :state_id, :password_confirmation)
      end
  end
end
