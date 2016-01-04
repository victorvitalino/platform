require 'csv'

namespace :entity do
  desc "migração entidades"
  task :migrate => :environment do
    @index = 0
    CSV.foreach("lib/files/entities.csv", :col_sep => "#") do |row|
      @index += 1

        @entity = Entity::Cadastre.new({
          cnpj: row[0],
          name: row[1].to_s.upcase,
          fantasy_name: row[2].to_s.upcase,
          telephone: row[3],
          telephone_optional: row[4],
          email: row[6].to_s.downcase,
          address: row[7],
          city_id: row[8],
          cep: row[9],
          observation: row[10]
        })

        begin 
          @entity.save
          puts @index
        rescue
          puts "DEU RUIM"
        end
     

      
    end
  end

  task :candidate => :environment do
    @index = 0
    CSV.foreach("lib/files/entity_cadastres.csv", :col_sep => "#") do |row|
      @index += 1

        @candidate = Entity::Candidate.new({
          candidate_id: row[0],
          cadastre_id: row[3],
          status: true,
          date_in: Time.now,
          date_out: Time.now,
          accepted: true,
          date_accepted: Time.now
        })

        begin 
          @candidate.save
          puts @index
        rescue
          puts "DEU RUIM"
        end
     

      
    end
  end



  task :status => :environment do
    @index = 0
    CSV.foreach("lib/files/entity_status.csv", :col_sep => "#") do |row|
      @index += 1

        @status = Entity::Situation.new({
          cadastre_id: row[0],
          situation_status_id: row[1],
        })

        begin 
          @status.save
          puts @index
        rescue
          puts "DEU RUIM"
        end
     

      
    end
  end
end