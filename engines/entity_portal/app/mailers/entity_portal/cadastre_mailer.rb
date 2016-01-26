module EntityPortal
  class CadastreMailer < ActionMailer::Base
    default from: 'nao-responda@codhab.df.gov.br'

    def success(email)
      mail(to: email, subject: "CODHAB - Cadastro de entidade realizado com sucesso")
    end
  end
end