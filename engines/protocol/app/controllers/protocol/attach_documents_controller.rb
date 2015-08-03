module Protocol
    class AttachDocumentsController < ApplicationController
     layout 'layouts/material'
      before_action :set_allotment, except: [:add,:send_conduct,:staffies,:receive,:update_docs]
      before_action :set_conduct, only:[:destroy,:show]
      before_action :set_conducts, only: [:index, :new,:add,:destroy, :send_conduct]
      after_action :update_allotment, only: [:create]

        def index
            #authorize @conducts
        end

        def new
            @attach_document = @assessment.attach_documents.new
            sector = current_user.account.sector_current.id
            #authorize @conduct
            #parametro 4 documento recebido pelo setor
            @conduct_result = Protocol::Conduct.find_document(params[:document],params[:document_type],4,sector)

        end

        def add
            #authorize @conduct
            sector = current_user.account.sector_current.id

            @allotment = Protocol::Allotment.find(params[:id])
            @conduct = @allotment.conducts.new
            @conduct.set_data(current_user, params[:assessment_id])

            if @conduct.save
                flash[:success] = t :success
                redirect_to new_allotment_conduct_path(@allotment)
            else
                flash[:danger] = t :error
                redirect_to action: 'new'
            end
        end

        def receive
            @conduct = Protocol::Conduct.new
            @conduct_receive = Protocol::Conduct.find_sector(current_user.account.sector_current.id,1)
        end

        def return
            @conduct = Protocol::Conduct.new
            @conduct_receive = Protocol::Conduct.find_sector(current_user.account.sector_current.id,1)
        end

         def update_docs
            #authorize @location
            @assessment = Protocol::Assessment.find(params[:assessment_ids])
                @assessment.each do |a|
                    @conduct = Protocol::Conduct.new
                    allotment = Protocol::Conduct.where(assessment_id: a.id).last
                    @conduct.allotment_id = allotment.allotment_id
                    @conduct.conduct_type = params[:type].to_i
                    @conduct.assessment_id = a.id
                    @conduct.sector_id = current_user.account.sector_current.id
                    @conduct.staff_id = current_user.account.id
                    @conduct .save
                end
            redirect_to allotments_path
        end


        def staffies
         @sector = Person::Sector.find(params[:sector_id])
          render json: @sector.staffs
        end

        def send_conduct
          # authorize @conduct
           @allotment = Protocol::Allotment.find(params[:allotment_id])
           @conduct = @allotment.conducts.new
        end

        def update_allotment
            @allotment.update(amount_docs:@allotment_conduct.count, status: true)
       end

        def create

            @allotment_conduct = Protocol::Conduct.where(allotment_id: params[:allotment_id], conduct_type: 0, sector_id: current_user.account.sector_current.id)
            #authorize @conduct
             @allotment_conduct.each do |lote|
                @conduct = Protocol::Conduct.new(set_conduct_params)
                @conduct.allotment_id = params[:allotment_id]
                @conduct.conduct_type = 1
                @conduct.assessment_id = lote.assessment_id
                @conduct.sector_id = params[:conduct][:sector_id]
                @conduct.staff_id = params[:conduct][:staff_id]
                @conduct .save
             end

             redirect_to allotments_path

        end

        def show
        end


        def destroy
            #authorize @conduct
            if @conduct.destroy
                redirect_to action: 'new'
            end
        end

        private


        def set_conducts
            @conducts = Conduct.find_allotment(params[:allotment_id])
        end

        def set_conduct
            @conduct = Conduct.find(params[:id])
        end

        def set_allotment
            @allotment = Allotment.find(params[:allotment_id])
        end



        def set_conduct_params
                params.require(:conduct).permit(:description, :conduct_type,:assessment_id,:sector_id,:allotment_id)
        end

    end
end