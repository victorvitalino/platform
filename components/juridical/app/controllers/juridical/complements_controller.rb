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
            @instancy_place = @legal_advice.complements.new
           # authorize @lawsuit
        end

        def create
            @complement = @legal_advice.complements.new(complement_params)
            #authorize @lawsuit
            @complement.save
        end

        def edit
        end

        def update
          #  authorize @lawsuit
            @complement.update(complement_params)
        end

        def destroy
          #  authorize @lawsuit
            if @complement.destroy
                redirect_to action: 'index'
            end
        end

        private

        def complement_params
            params.require(:complement).permit(:document_type_id, :lawsuit_id,:instancy_place_id,:distribution_date, :deadline,:days, :end_date, :complement, :responsible_lawyer, :advice_type_id, :file_path, :status, :complement_father_id, :staff_id)
        end

        def set_instancy_places
            @complements = @legal_advice.complements.all
        end

        def set_complement
            @complement = Complement.find(params[:id])
        end

        def set_legal_advice
            @legal_advice = LegalAdvice.find(params[:legal_advice_id])
        end

    end
end
