require_dependency "finance/application_controller"

module Finance
  class TypeGuidesController < ApplicationController
    before_action :set_type_guide, only: [:show, :edit, :update, :destroy]

    # GET /type_slips
    def index
      @type_guides = TypeGuide.unscoped.all
    end

    # GET /type_slips/1
    def show
    end

    # GET /type_slips/new
    def new
      @type_guide = TypeGuide.new
    end

    # GET /type_slips/1/edit
    def edit
    end

    # POST /type_slips
    def create
      @type_guide = TypeGuide.new(type_guide_params)

      if @type_guide.save
        flash[:success] = t :success
        redirect_to action: 'index'
      else
        render :new
      end
    end

    # PATCH/PUT /type_slips/1
    def update
      if @type_guide.update(type_slip_params)
        flash[:success] = t :success
        redirect_to action: 'index'
      else
        render :edit
      end
    end

    # DELETE /type_slips/1
    def destroy
      if @type_guide.destroy
        flash[:success] = t :success
        redirect_to action: 'index'
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_type_guide
        @type_guide = TypeGuide.unscoped.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def type_guide_params
        params.require(:type_guide).permit(:title, :publish, :value, :code)
      end
  end
end
