require 'csv'

namespace :csv do
  desc "migração csv"
  task :treta => :environment do

    @index = 0

    CSV.foreach("lib/files/situation_04_04_2016.csv", :col_sep => "#") do |row|

       @address = Candidate::CadastreSituation.new({
          cadastre_id:  row[0],
          situation_status_id:  row[1],
          created_at: row[2],


        begin
          @old.save
          #puts @old.inspect
          puts @index
        rescue e => Exception
          puts e
        end

        @index += 1

      else
        puts 'não encontrado'
      end
    end
  end
end
