require_dependency 'juridical/application_controller'

module Juridical
    class ComplainantsController < ApplicationController
        before_action :set_legal_advice
        before_action :set_complainants, only: [:index, :create, :destroy, :update]
        before_action :set_complainant, only: [:edit, :destroy, :update]

        def index
           #authorize @lawsuits
        end

        def new
            @complainant = @legal_advice.complainants.new
           # authorize @lawsuit
        end

        def create
            @complainant = @legal_advice.complainants.new(complainant_params)
            @complainant.staff_id = current_user.id
            #authorize @lawsuit
            @complainant.save

            @legal_advices = LegalAdvice.order(created_at: :desc)
        end

        def edit
        end

        def update
          #  authorize @lawsuit
            @complainant.update(complainant_params)
        end

        def destroy
          #  authorize @lawsuit
            if @complainant.destroy
                redirect_to action: 'index'
            end
        end

        private

        def complainant_params
            params.require(:complainant).permit(:name)
        end

        def set_complainants
            @complainants = @legal_advice.complainants.all
        end

        def set_legal_advice
            @legal_advice = LegalAdvice.find(params[:legal_advice_id])
        end

        def set_complainant
            @complainant = Complainant.find(params[:id])
        end
    end
end
