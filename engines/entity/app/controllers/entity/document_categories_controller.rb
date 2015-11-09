require_dependency 'entity/application_controller'

module Entity
  class DocumentCategoriesController < ApplicationController

    def index
      @categories = DocumentCategory.all.order(:created_at)
    end

    def new
      @category = DocumentCategory.new
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
      if @category.update(set_params)
        flash[:success] = t :success
        redirect_to action: 'index'
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
      params.require(:document_category).permit(:name, :description, :code, :status)
    end

    def set_document_category
      @category = DocumentCategory.find(params[:id])
    end
 end
end