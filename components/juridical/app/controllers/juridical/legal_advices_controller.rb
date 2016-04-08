require_dependency 'juridical/application_controller'

module Juridical
  class LegalAdvicesController < ApplicationController
    before_action :set_legal_advice, only: [:show, :edit, :update, :destroy]

    has_scope :process
    has_scope :lawyer
    has_scope :status


    def index
            @legal_advices = LegalAdvice.all
            @legal_advices = apply_scopes(@legal_advices).paginate(:page => params[:page], :per_page => 20)
    end


    def new
       @legal_advice = LegalAdvice.new
        # authorize :assessment,  :create?
    end

    def create
       # authorize :assessment,  :create?

          @legal_advice = LegalAdvice.new(set_legal_advice_params)
          if @legal_advice.save!
              redirect_to action: 'index'
          else
              render action: 'new'
          end
    end


    def show

      begin
        doc = Nokogiri::HTML(open("http://tjdf19.tjdft.jus.br/cgi-bin/tjcgi1?NXTPGM=tjhtml105&SELECAO=1&ORIGEM=INTER&CIRCUN=1&CDNUPROC=20110110541696"))
         @data = []
          doc.css('//tr').each_with_index do |link, index|
            @data[index] =  []
            link.css('td').each_with_index do |a, i|
              @data[index][i] = a.children.content
            end
          end
      rescue
        flash[:danger] = "Problemas de comunicação com TJDFT."
      end
    end

    def edit

    end

    def update
        #authorize :assessment,  :update?
        if @legal_advice.update(set_legal_advice_params)
            flash[:success] = "Documento atualizado."
            redirect_to legal_advices_path
        else
            render action: 'edit'
        end
    end

    def destroy
        #authorize :assessment,  :destroy?
        @legal_advice.destroy
        redirect_to action: 'index'
    end

    private

     def set_legal_advice
        @legal_advice = LegalAdvice.find(params[:id])
     end


    def set_legal_advice_params
            params.require(:legal_advice).permit(:process_number, :agency, :lawsuit_id, :lawsuit_value, :instancy_place_id, :housing_program_id, :process_type)
    end

  end
end
