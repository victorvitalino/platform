module CandidateAttendance
  module Habitation
    class CadastreProcedural < Candidate::CadastreProcedural
      attr_accessor :attendance_option, :supervisor_option
      
      enum attendance_option: {'indeferido_em_análise' => '76', 'deferido_em_ordem' => '7'}
      enum supervisor_option: {'indeferido' => '11', 'deferido_em_ordem_para_publicação' => '14'}
      
      validates :procedural_status_id, :observation, presence: true

      def set_assessment
        cadastre = Candidate::Cadastre.find(self.cadastre_id)
        procedurals = cadastre.cadastre_procedurals
        
        if procedurals.present?
          # => não realiza a criação de processo
          self.assessment_id = procedurals.last.id
        else
          # => realiza a criação de processo
          assessment = Protocol::Assessment.new
          assessment.staff_id = self.staff_id
          assessment.document_type_id = 1
          assessment.cpf      = self.cpf
          assessment.save
          
          self.assessment_id  = assessment.id
        end
      end

    end
  end
end