require_dependency 'habitation/application_controller'

module Habitation
  module Attendance
    class CadastreMirrorsController < ApplicationController
      before_action :set_cadastre, only: [:new]
      before_action :set_cadastre_mirror, except: [:new]

      def new
        if @cadastre.cadastre_mirrors.where(situation: [0,1]).present?
          flash[:danger] = "Já existe uma atualização ativa, favor finaliza-la antes de iniciar outra"
          redirect_to attendance_attendances_path(cpf: @cadastre.cpf)
        else
          @mirror = @cadastre.cadastre_mirrors.new
          @mirror.set_clone(@cadastre.attributes)
          if @mirror.save
            @mirror.set_clone_dependent(@cadastre.dependents)
            @mirror.attendance_log!("atendimento iniciado", current_user.id)
            
            flash[:success] = t :success
            redirect_to attendance_attendances_path(cpf: @cadastre.cpf)
          else
            flash[:danger] = "Não foi possível iniciar o atendimento"
            redirect_to attendance_attendances_path(cpf: @cadastre.cpf)
          end
          
        end
      end

      def edit
      end

      def update
        if @mirror.update(set_params)
          @mirror.attendance_log!("cadastro atualizado", current_user.id)  
          flash[:success] =  t :success
          redirect_to action: :edit
        else
          flash[:danger] =  t :danger
          render action: :edit
        end
      end


      def destroy
        @mirror = Candidate::CadastreMirror.find(params[:id])
        
        if @mirror.destroy 
          @mirror.attendance_log!("atendimento removido", current_user.id)  
          flash[:success] = t :success
        else
          flash[:danger] = t :danger
        end
        
        redirect_to attendance_attendances_path(cpf: @mirror.cpf)
      end

      private

      def set_params
        params.require(:cadastre_mirror).permit(:born, :gender, :civil_state_id, :arrival_df, :income,
                                                :special_condition_id, :adapted_property, :cid, :nis)
      end

      def set_cadastre_mirror
        @mirror = Candidate::CadastreMirror.find(params[:id]) rescue nil
      end

      def set_cadastre
        @cadastre = Candidate::Cadastre.find(params[:id]) rescue nil
      end

    end
  end
end