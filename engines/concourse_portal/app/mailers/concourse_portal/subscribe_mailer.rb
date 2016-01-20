module ConcoursePortal
  class SubscribeMailer < ActionMailer::Base
    default from: 'concursos@codhab.df.gov.br'

    def success(email, candidate, project)
      @project    = project
      @candidate  = candidate
      mail(to: email, subject: "CODHAB - #{email}- Inscrição Recebida")
    end

    def remember_password(email, candidate, project, key)
      @project    =  project 
      @candidate  =  candidate 
      @key        =  key
      mail(to: email, subject: "CODHAB | CONCURSOS - Atualização de senha")
    end
  end
end