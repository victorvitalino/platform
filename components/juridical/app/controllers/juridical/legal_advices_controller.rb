require_dependency 'juridical/application_controller'

module Juridical
  class LegalAdvicesController < ApplicationController
    before_action :set_legal_advice, only: [:show, :edit, :update, :destroy]

    has_scope :process
    has_scope :lawyer
    has_scope :status


    def index
      @legal_advices = LegalAdvice.order(created_at: :desc)
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

       process = @legal_advice.process_number.gsub('.','').gsub('-','')
       url = "http://tjdf19.tjdft.jus.br/cgi-bin/tjcgi1?NXTPGM=tjhtml105&SELECAO=1&ORIGEM=INTER&CIRCUN=1&CDNUPROC=#{process}"

        doc =  Nokogiri::HTML(open(url))
         @data = []
          doc.xpath('//tr').each_with_index do |link, index|
            @data[index] =  []
            link.xpath('td').each_with_index do |a, i|
              #@teste = a.inner_html
              @data[index][i] = a.content
              if @data[index][2]
              @data[index][2] = a.children.to_s.encode("UTF-8").html_safe
              end
            end

          end
        @complainants = @legal_advice.complainants.all
        @defendants = @legal_advice.defendants.all
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
