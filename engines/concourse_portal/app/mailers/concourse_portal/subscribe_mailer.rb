module ConcoursePortal
  class SubscribeMailer < ActionMailer::Base
    default from: 'concursos@codhab.df.gov.br'

    def success(email, candidate, project)
      @project    = project
      @candidate  = candidate
      mail(to: email, subject: "CODHAB - #{email}- Inscrição Recebida")
    end
  end
end