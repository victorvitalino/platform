module Mailer
  class SimpleMailer < ActionMailer::Base
    default from: 'comunicacao@codhab.df.gov.br'

    def send_mail_entity(email)
      mail(to: email, subject: "Lançamento Habita Brasília - Convite")
    end

  end
end