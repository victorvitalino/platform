require_dependency 'finance/application_controller'

module Finance
  class PaymentGuidesController < ApplicationController
    def index
      if params[:start].present?
        @payment_guides = PaymentGuide.search(params)
      else
        @payment_guides = PaymentGuide.where(created_at:Date.today.beginning_of_month..Date.today.end_of_month).order('created_at DESC')
      end
   
    end

    def new
      @guide = PaymentGuide.new
    end

    def create
      @guide = PaymentGuide.new(set_params)

      if @guide.save
        flash[:success] = t :success
        redirect_to @guide
      else
        render action: 'new'
      end
    end

    def show
      @payment_guide = PaymentGuide.find(params[:id])
    end

    private

    def set_params
      params.require(:payment_guide).permit(:type_guide_id, :model_guide, :value, :deadline, :name, :cpf, :observation)
    end
  end
end
