require_dependency 'concourse/candidate'

module ConcoursePortal
  class Certificate
    include ActiveModel::Model

    attr_accessor :candidate, :cpf

    validates :candidate, :cpf, presence: true
    validates :cpf, cpf: true 
    validate  :candidate_exist?


    private

    def candidate_exist?

      @subscribe = Concourse::Candidate.where(status: 2).find(self.candidate) rescue nil
      
      if @subscribe.present?
        unless @subscribe.cpf == self.cpf
          # TO-DO
          # verifica se o cpf está vinculado na equipe do candidato
          errors.add(:cpf, "CPF não vínculado ao inscrição informada")
        end
      else
        errors.add(:candidate, "Nº de inscrição não encontrado ou não homologado")
      end
    end


  end
end