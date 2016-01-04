require_dependency 'regularization/application_controller'
require_dependency 'candidate/cadastre'

module Regularization
  class AttendancesController < ApplicationController

    include Wicked::Wizard

    steps :verify, :update_cadastre, :requeriments, :checklist, :conclusion

    def show
      case step
      when :verify 
        @cadastre = Verify.new
      when :update_cadastre
        if session[:cadastre_id].present?
          @cadastre = Cadastre.find(session[:cadastre_id])
        else
          @cadastre = Cadastre.new
        end
      when :requeriments
        @cadastre = Cadastre.find(session[:cadastre_id])
      when :checklist
        @cadastre = Cadastre.find(session[:cadastre_id])
        @requeriment = Requeriment.find(params[:requeriment_id])
      when :conclusion
        @cadastre = Cadastre.find(session[:cadastre_id])
        @requeriment = Requeriment.find(params[:requeriment_id])
      end
      
      render_wizard
    end

    def update
      @cadastre = Cadastre.find(session[:cadastre_id])

      render_wizard @cadastre
    end

    def checklist
    end

    def verify
      @cadastre = Verify.new
      @cadastre.cpf = params[:verify][:cpf]

      if @cadastre.valid?
        session[:cadastre_id] = @cadastre.record_exists? ?  @cadastre.id : nil 
        redirect_to attendance_path(id: :update_cadastre)
      else
        jump_to(:verify)
      end
    end

  end
end