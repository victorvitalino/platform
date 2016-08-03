require 'csv'

namespace :mailer do
  
  task :with_template => :environment do 
    

    Concourse::Candidate.where('subscribe_id = 6 and status <> 2').each do |candidate|
      puts candidate.email
      Mailer::SimpleMailer.send_with_template(candidate.email, "Últimos dias para inscrições e pagamento do boleto").deliver_now!
    end

  end

  task :with_template_base => :environment do 

    Concourse::Candidate.where(subscribe_id: 6).each do |candidate|
      puts candidate.email
      Mailer::SimpleMailer.send_with_template_base(candidate.email, "Concursos CODHAB: Errata nº 01 - Notificação").deliver_now!
    end

  end

end