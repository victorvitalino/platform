require 'csv'

namespace :candidate do

  desc "migração Cadastros"
  task :cadastres => :environment do
    @index = 0
    @error = Array.new
    CSV.foreach("lib/files/migrate/current/candidate_cadastres.csv", :col_sep => "#") do |row|

      begin
      
      @candidate = Candidate::Cadastre.new
      
      @candidate.seqcad       = row[0]
      @candidate.cpf          = row[1].to_s.gsub('.', '').gsub('-','').strip
      @candidate.gender       = row[2]
      @candidate.born         = row[3]
      @candidate.rg           = row[4].to_s.strip.downcase
      @candidate.rg_org       = row[5].to_s.strip.downcase
      @candidate.born_uf      = row[6]
      @candidate.arrival_df   = row[7]

      @candidate.build_user_candidate(username: @candidate.cpf,
                            password: '12345678',
                            password_confirmation: '12345678')
      
      if @candidate.save!
        @index = @index + 1 
        puts @index
      end

      rescue Exception => e
        puts "ERROR- #{e}"
      end
    end
  end



    desc "migração Complemento"
  task :adjuct => :environment do
    @index = 0
    @error = Array.new
    CSV.foreach("lib/files/migrate/current/candidate_adjuct_cadastres.csv", :col_sep => "#") do |row|

      begin
      
      @candidate = Candidate::AdjuctCadastre.new
      
      @candidate.telephone              = row[0]
      @candidate.email                  = row[1].to_s.downcase.strip
      @candidate.special_condition_id   = row[2]
      @candidate.cep                    = row[3].to_s.strip
      @candidate.address                = row[4].to_s.downcase.strip
      @candidate.income                 = row[5]
      @candidate.address_work           = row[6]
      @candidate.nis                    = row[7]
      @candidate.civil_state_id         = row[8]
      @candidate.name                   = row[9].to_s.downcase.strip
      @candidate.flag_special_condition = row[10]
      @candidate.cadastre_id            = row[11]
      @candidate.city_id                = row[12]


      if @candidate.save!
        @index = @index + 1 
        puts @index
      end

      rescue Exception => e
        puts "ERROR- #{e}"
      end
    end
  end
end