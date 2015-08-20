require_dependency "finance/application_controller"

module Finance
  class TypeSlipsController < ApplicationController
    before_action :set_type_slip, only: [:show, :edit, :update, :destroy]

    # GET /type_slips
    def index
      @type_slips = TypeSlip.unscoped.all
    end

    # GET /type_slips/1
    def show
    end

    # GET /type_slips/new
    def new
      @type_slip = TypeSlip.new
    end

    # GET /type_slips/1/edit
    def edit
    end

    # POST /type_slips
    def create
      @type_slip = TypeSlip.new(type_slip_params)

      if @type_slip.save
        flash[:success] = t :success
        redirect_to action: 'index'
      else
        render :new
      end
    end

    # PATCH/PUT /type_slips/1
    def update
      if @type_slip.update(type_slip_params)
        flash[:success] = t :success
        redirect_to action: 'index'
      else
        render :edit
      end
    end

    # DELETE /type_slips/1
    def destroy
      if @type_slip.destroy
        flash[:success] = t :success
        redirect_to action: 'index'
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_type_slip
        @type_slip = TypeSlip.unscoped.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def type_slip_params
        params.require(:type_slip).permit(:title, :publish, :value, :code)
      end
  end
end
