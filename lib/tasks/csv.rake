require 'csv'

namespace :csv do
  desc "migração csv"
  task :treta => :environment do
    @index = 0
    CSV.foreach("lib/files/contemplado.csv", :col_sep => "#") do |row|
      @index += 1

        @ref = Candidate::CadastreSituation.new({
          cadastre_id: row[0],
          created_at: row[1],
          situation_status_id: 7
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