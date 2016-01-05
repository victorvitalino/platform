require 'csv'

namespace :csv do
  desc "migração csv"
  task :treta => :environment do
    @index = 0
    CSV.foreach("lib/files/nao_habilitado.csv", :col_sep => "#") do |row|
      @index += 1

        @ref = Candidate::CadastreSituation.new({
          cadastre_id: row[0],
          created_at: row[1],
          situation_status_id: 38
        })

        begin
          @ref.save
          #puts @ref.inspect
          puts @index
        rescue Exception => e 
          puts e
        end
     
    end
  end


  task :treta2 => :environment do
    @index = 0
    CSV.foreach("lib/files/contemplados_habilitados.csv", :col_sep => "#") do |row|
      @index += 1

        @ref = Candidate::CadastreSituation.new({
          cadastre_id: row[1],
          created_at: row[2],
          situation_status_id: 4
        })

        begin
          @ref.save
          #puts @ref.inspect
          puts @index
        rescue Exception => e 
          puts e
        end
     
    end
  end


  task :treta3 => :environment do
    @index = 0
    CSV.foreach("lib/files/habilitados.csv", :col_sep => "#") do |row|
      @index += 1

        @ref = Candidate::CadastreSituation.new({
          cadastre_id: row[0],
          created_at: row[1],
          situation_status_id: 4 
        })

        begin
          @ref.save
          #puts @ref.inspect
          puts @index
        rescue Exception => e 
          puts e
        end
     
    end
  end
end