module Action
  class ProfessionsController < ApplicationController
    before_action :set_profession, only: [:show, :edit, :update, :destroy]

    def index
      @professions = Action::Profession.all
    end

    def show

    end

    # GET /posts/new
    def new
      @profession = Profession.new
    end

    # GET /posts/1/edit
    def edit

    end

    # POST /posts
    def create
      @profession = Profession.new(profession_params)
      if @profession.save
        redirect_to action: 'index'
      else
        render :new
      end
    end

    # PATCH/PUT /posts/1
    def update
      if @profession.update(profession_params)
        redirect_to action: 'index'
      else
        render :edit
      end
    end

    # DELETE /posts/1
    def destroy
      @profession.destroy
      redirect_to professions_url, notice: 'Post was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_profession
        @profession = Action::Profession.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def profession_params
        params.require(:profession).permit(:name, :status)
      end
  end
end
