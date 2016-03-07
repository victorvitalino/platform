module Address
    class DocumentsController < ApplicationController
        layout 'shared/empty'
        def descriptive
          @candidate = Candidate::CadastreAddress.where(cadastre_id: params[:id]).last
        end
    end
end
