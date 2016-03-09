require_dependency "dashboard/application_controller"

module Dashboard
  class WarningController < ApplicationController
    def index
      @warnings = Warning.all
    end

    def show
    end

    def new
      @warning = Warning.new
    end

    def create
      @warning = Warning.new(warning_params)
      if @warning.save
        redirect_to action: 'index'
      else
        render :new
      end
    end

    def update
      if @warning.update(warning_params)
        redirect_to action: 'index'
      else
        render :edit
      end
    end

    def destroy
      @warning.destroy
      redirect_to warnings_url, notice: 'Warning was successfully destroyed.'
    end


    private
    def set_warning
      @warning = Dashboard::Warning.find(params[:id])
    end

    def warning_params
      params.require(:warning).permit(:title, :content, :resume, :date, :publish)
    end
  end
end
