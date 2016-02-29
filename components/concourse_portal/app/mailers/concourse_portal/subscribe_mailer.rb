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

    def checked(email, number)
      @email = email 
      @number = number
      mail(to: email, subject: "Concurso Público Nacional de Projetos de Arquitetura e Complementares para Centros de Ensino Infantil (CEI) – Inscrição Homologada - Nº #{number}")
    end

  end
end