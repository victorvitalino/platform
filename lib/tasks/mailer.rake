require 'csv'

namespace :mailer do
  
  task :with_template => :environment do 

    Concourse::CandidateParticipation.all.each do |item|
      project = item.candidate.subscribe.project

      Mailer::SimpleMailer.send_with_template(item.candidate.email, project, "CODHAB - Pesquisa de opnião").deliver_now!
    end

  end

  task :with_template_base => :environment do 

    Concourse::Candidate.where(subscribe_id: 6).each do |candidate|
      puts candidate.email
      Mailer::SimpleMailer.send_with_template_base(candidate.email, "Concursos CODHAB: Errata nº 01 - Notificação").deliver_now!
    end

  end

end