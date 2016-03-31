require_dependency 'juridical/application_controller'

module Juridical
    class ComplementsController < ApplicationController
        before_action :set_legal_advice
        before_action :set_complements, only: [:index, :create, :destroy, :update]
        before_action :set_complement, only: [:edit, :destroy, :update]


        def index
           #authorize @lawsuits
        end

        def new
            @complement = @legal_advice.complement.new
           # authorize @lawsuit
        end

        def create
            @complement = @legal_advice.complement.new(complement_params)
            #authorize @lawsuit
            @complement.save

            redirect_to legal_advice_complements_path(@complement.legal_advice_id)

        end

        def edit
        end

        def update
          #  authorize @lawsuit
            @complement.update(complement_params)

             redirect_to legal_advice_complements_path(@complement.legal_advice_id)
        end

        def destroy
          #  authorize @lawsuit
            if @complement.destroy
                redirect_to action: 'index'
            end
        end

        private

        def complement_params
            params.require(:complement).permit(:document_type_id, :lawsuit_id,:instancy_place_id,:distribution_date, :deadline,:days, :end_date, :complement, :responsible_lawyer, :advice_type_id, :file_path, :status, :complement_father_id, :staff_id,:legal_advice_id)
        end

        def set_complements
            @complements = @legal_advice.complement.all
        end

        def set_complement
            @complement = Complement.find(params[:id])
        end

        def set_legal_advice
            @legal_advice = LegalAdvice.find(params[:legal_advice_id])
        end

    end
end
