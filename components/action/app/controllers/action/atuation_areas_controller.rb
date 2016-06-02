module Action
  class AtuationAreasController < ApplicationController
    before_action :set_atuation_area, only: [:show, :edit, :update, :destroy]

    def index
      @atuations = Action::AtuationArea.all
    end

    def show

    end

    # GET /posts/new
    def new
      @atuation = AtuationArea.new
    end

    # GET /posts/1/edit
    def edit

    end

    # POST /posts
    def create
      @atuation = AtuationArea.new(atuation_area_params)
      if @atuation.save
        redirect_to action: 'index'
      else
        render :new
      end
    end

    # PATCH/PUT /posts/1
    def update
      if @atuation.update(atuation_area_params)
        redirect_to action: 'index'
      else
        render :edit
      end
    end

    # DELETE /posts/1
    def destroy
      @atuation.destroy
      redirect_to atuation_areas_url, notice: 'Post was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_atuation_area
        @atuation = Action::AtuationArea.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def atuation_area_params
        params.require(:atuation_area).permit(:name, :status)
      end
  end
end
