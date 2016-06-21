require 'csv'

namespace :mailer do
  
  task :old_entity => :environment do
    index = 0
    CSV.foreach("lib/files/old_entity.csv", :col_sep => "#") do |row|
      index += 1
      cnpj  = row[0].to_s.gsub('.','').gsub('-','').gsub('/','')
      email = row[3].to_s.downcase.strip

      unless Entity::Cadastre.find_by_cnpj(cnpj).present?        
        Mailer::SimpleMailer.send_mail_entity(email).deliver_now!
      end

      puts index
    end
  end

  task :new_entity => :environment do 
  end

end