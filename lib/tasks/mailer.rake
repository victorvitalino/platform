require 'csv'

namespace :mailer do
  
  task :old_entity => :environment do
    index = 0
    CSV.foreach("public/files/old_entity.csv", :col_sep => "#") do |row|
      cnpj  = row[0].to_s.gsub('.','').gsub('-','').gsub('/','')
      email = row[3].to_s.downcase.strip

      unless Entity::Cadastre.find_by_cnpj(cnpj).present?        
        index += 1
        Mailer::SimpleMailer.send_mail_entity(email).deliver_now!
        puts index
      end

    end

    index2 = 0
    CSV.foreach("public/files/new_entity.csv", :col_sep => "#") do |row|
      email = row[0].to_s.downcase.strip
      index2 += 1
      Mailer::SimpleMailer.send_mail_entity(email).deliver_now!
      puts index2
    end

  end

  task :new_entity => :environment do 
  end

end