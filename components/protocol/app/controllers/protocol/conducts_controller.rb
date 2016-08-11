require_dependency 'protocol/application_controller'

module Protocol
    class ConductsController < ApplicationController
      before_action :set_allotment, except: [:add,:send_conduct,:staffies,:receive,:update_docs,:return]
      before_action :set_conduct, only:[:destroy,:show]
      before_action :set_conducts, only: [:index, :new,:add,:destroy, :send_conduct]
      after_action :update_allotment, only: [:create]

        def index
            authorize :conduct,  :index?
        end

        def new
            authorize :conduct, :add?
            @conduct = @allotment.conducts.new

            sector = current_user.sector_current.id

            #parametro 4 documento recebido pelo setor
            @conduct_result = Protocol::Conduct.find_document(params[:document],params[:document_type],4,sector, 0)

        end

        def add
            authorize :conduct,  :add?
            sector = current_user.sector_current.id

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
            authorize :conduct,  :receive?
            @conduct = Protocol::Conduct.new
            @conduct_receive = Protocol::Conduct.find_sector(current_user.sector_current.id,1)
        end

        def return
            @conduct = Protocol::Conduct.new
            @conduct_receive = Protocol::Conduct.find_sector(current_user.sector_current.id,1)
        end

         def update_docs
            authorize :conduct,  :receive?
            @assessment = Protocol::Assessment.find(params[:assessment_ids])
                @assessment.each do |a|
                    @conduct = Protocol::Conduct.new
                    allotment = Protocol::Conduct.where(assessment_id: a.id).order('created_at DESC').first
                    @conduct.allotment_id = allotment.allotment_id
                    @conduct.conduct_type = params[:type].to_i
                    @conduct.assessment_id = a.id
                    @conduct.sector_id = current_user.sector_current.id
                    @conduct.staff_id = current_user.id
                    @conduct .save
                end
            if params[:type].to_i  == 4
              flash[:success] = "Documento(s) recebido(s) com sucesso!"
              redirect_to receive_path
            else
              flash[:success] = "Documento(s) devolvido(s) com sucesso!"
              redirect_to return_path
            end
        end


        def staffies
         @sector = Person::Sector.find(params[:sector_id])
          render json: @sector.staffs
        end

        def send_conduct
           authorize :conduct,  :add?
           @allotment = Protocol::Allotment.find(params[:allotment_id])
           @conduct = @allotment.conducts.new
        end

        def update_allotment
            @allotment.update(amount_docs:@allotment_conduct.count, status: true)
        end

        def create

            @allotment_conduct = Protocol::Conduct.where(allotment_id: params[:allotment_id], conduct_type: 0, sector_id: current_user.sector_current.id)
             authorize :conduct,  :create?
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
                flash[:danger] = "Documento excluído da remessa"
                redirect_to new_allotment_conduct_path(@allotment)
            else
                flash[:danger] = t :error
                redirect_to new_allotment_conduct_path(@allotment)
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
