require 'csv'

namespace :csv do
  desc "migração csv"
  task :renda => :environment do

    @index = 0
    CSV.foreach("lib/files/renda_22_03_2016.csv", :col_sep => "#") do |row|

        
        @candidate = Candidate::Cadastre.find_by_cpf(row[1]) rescue nil

        if !@candidate.nil? 
          @candidate.income = row[0]
          @candidate.save 
          #puts @candidate.inspect
          puts @index
        end
       
      @index += 1

    end
  end
end
