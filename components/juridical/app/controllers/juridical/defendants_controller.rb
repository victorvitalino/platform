require_dependency 'juridical/application_controller'

module Juridical
    class DefendantsController < ApplicationController
        before_action :set_legal_advice
        before_action :set_defendants, only: [:index, :create, :destroy, :update]
        before_action :set_defendant, only: [:edit, :destroy, :update]

        def index
           #authorize @lawsuits
        end

        def new
            @defendant = @legal_advice.defendants.new
           # authorize @lawsuit
        end

        def create
            @defendant = @legal_advice.defendants.new(defendant_params)
            @defendant.staff_id = current_user.id
            #authorize @lawsuit
            @defendant.save

            @legal_advices = LegalAdvice.order(created_at: :desc)
        end

        def edit
        end

        def update
          #  authorize @lawsuit
            @defendant.update(defendant_params)
        end

        def destroy
          #  authorize @lawsuit
            if @defendant.destroy
                redirect_to action: 'index'
            end
        end

        private

        def defendant_params
            params.require(:defendant).permit(:name)
        end

        def set_defendants
            @defendants = @legal_advice.defendants.all
        end

        def set_defendant
            @defendant = Defendant.find(params[:id])
        end

        def set_legal_advice
            @legal_advice = LegalAdvice.find(params[:legal_advice_id])
        end
    end
end
