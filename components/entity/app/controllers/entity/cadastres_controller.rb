require_dependency 'entity/application_controller'

module Entity
  class CadastresController < ApplicationController
    before_action :set_cadastre, only: [:edit, :update, :destroy]

    has_scope :cnpj
    has_scope :name_entity
    has_scope :fantasy_name

    def index
      if params[:query].present?
        if params[:query] == 'senders'
          @cadastres = Cadastre.senders.paginate(:page => params[:page], :per_page => 30).order('created_at DESC')
        end

        if params[:query] == 'complete'
          @cadastres = Cadastre.complete.paginate(:page => params[:page], :per_page => 30).order('created_at DESC')
        end
      else
        @cadastres = apply_scopes(Cadastre).paginate(:page => params[:page], :per_page => 30).order('created_at DESC')
      end
    end



    def new
      @category = DocumentCategory.new
    end

    def show
      @cadastre = Cadastre.find(params[:id])
    end

    def create
      @category = DocumentCategory.new(set_params)

      if @category.save
        flash[:success] = t :success
        redirect_to action: 'index'
      else
        render action: 'new'
      end
    end

    def edit
    end

    def update
      if @cadastre.update(set_params)
        flash[:success] = t :success
        redirect_to cadastre_path(@cadastre)
      else
        render action: 'edit'
      end
    end

    def destroy
      if @category.destroy
        flash[:success] = t :success
      else
        flash[:danger] = t :danger
      end
      redirect_to action: 'index'
    end

    private

    def set_params
      params.require(:cadastre).permit(:name, :fantasy_name, :email, :telephone,
                                                :telephone_optional, :celphone, :city, :address, :complement,
                                                :cep, :observation)
    end

    def set_cadastre
      @cadastre = Entity::Cadastre.find(params[:id])
    end
  end
end