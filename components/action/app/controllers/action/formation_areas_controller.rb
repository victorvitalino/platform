module Action
  class FormationAreasController < ApplicationController
    before_action :set_formation_area, only: [:show, :edit, :update, :destroy]

    def index
      @formations = Action::FormationArea.all
    end

    def show

    end

    # GET /posts/new
    def new
      @formation = FormationArea.new
    end

    # GET /posts/1/edit
    def edit

    end

    # POST /posts
    def create
      @formation = FormationArea.new(formation_area_params)
      if @formation.save
        redirect_to action: 'index'
      else
        render :new
      end
    end

    # PATCH/PUT /posts/1
    def update
      if @formation.update(formation_area_params)
        redirect_to action: 'index'
      else
        render :edit
      end
    end

    # DELETE /posts/1
    def destroy
      @formation.destroy
      redirect_to formation_areas_url, notice: 'Post was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_formation_area
        @formation = Action::FormationArea.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def formation_area_params
        params.require(:formation_area).permit(:name, :status)
      end
  end
end
