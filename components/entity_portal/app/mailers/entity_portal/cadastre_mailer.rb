module EntityPortal
  class CadastreMailer < ActionMailer::Base
    default from: 'nao-responda@codhab.df.gov.br'

    def success(email)
      mail(to: email, subject: "CODHAB - Cadastro de entidade realizado com sucesso")
    end

    def remember(email, password)
      @password = password 
      mail(to: email, subject: "CODHAB - Senha recadastramento de entidades")
    end
  end
end