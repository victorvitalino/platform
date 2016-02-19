namespace :send_mail do
  desc "enviar e-mail"
  task :cei => :environment do
    
    @candidates = Concourse::Candidate.where(status: 2, subscribe_id: 2)

    puts @candidates.count
    
    @candidates.each do |candidate|
      puts candidate.email
      ConcoursePortal::SubscribeMailer.checked(candidate.email).deliver_now!
    end
  end
end

=begin 
estevanbarin@yahoo.com.br
arquea@arquea.com.br
leggiordano@gmail.com
arquiteta@taisafestugato.com.br
tello.marina@gmail.com
arqnapoleaof@hotmail.com
victor@serranosilva.com.br
correa@paralelo23.com
sergiofaraulo@arcoo.com.br
susan@eipper.com.br
s.steyer@st.arq.br
dalpian@dalpian.arq.br
accastagna@gmail.com
arthurcalliaricosta@hotmail.com
brunotenser@gmail.com
mario@figueroa.arq.br
analongato@hotmail.com
estudio@estudio41.com.br
lopesrousemara@yahoo.com
cinthiaduc@yahoo.com.br
paula.brazil@gmail.com
danielavmartins@gmail.com
anderson@organismovivo.arq.br
luis@projetopaulista.com.br
redearquitetos@gmail.com
contato@coda.arq.br
joao@lzplanejamento.com.br
ricardoborges.arquitetura@gmail.com
CONTATO@ROBSONAMARAL.COM.BR
muratori@fortalnet.com.br
=end