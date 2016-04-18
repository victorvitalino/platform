module ConcoursePortal
  class SubscribeMailer < ActionMailer::Base
    default from: 'concursos@codhab.df.gov.br'

    def success(candidate, project)
      @project    = project
      @candidate  = candidate
      
      mail(to: @candidate.email, subject: "CODHAB - #{@project.title}- Inscrição recebida")
    end

    def update(candidate, project)
      @project    = project
      @candidate  = candidate
      
      mail(to: @candidate.email, subject: "CODHAB - #{@project.title}- Inscrição atualizada")
    end

    def remember_password(email, candidate, project, key)
      @project    =  project 
      @candidate  =  candidate 
      @key        =  key
      mail(to: email, subject: "CODHAB | CONCURSOS - Atualização de senha")
    end

    def checked(email, number, project_id)
      @email    = email 
      @number   = number
      @project  = Concourse::Project.find(project_id)

      mail(to: email, subject: "Concurso Público Nacional de Projetos de Arquitetura e Complementares – Inscrição Homologada - Nº #{number}")
    end


    def project_send(email, number, project_id)
      @email    = email 
      @number   = number
      @project  = Concourse::Project.find(project_id)
      @participation = Concourse::CandidateParticipation.find_by_candidate_id(number)

      mail(to: email, subject: "Concurso Público Nacional de Projetos de Arquitetura e Complementares – Projeto Recebido - Inscrição Nº #{number}")
    end


    def crazy(email)
      mail(to: email, subject: "CODHAB - Envio dos projetos - UBS")
    end
  end
end