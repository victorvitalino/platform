require 'csv'

namespace :csv do
  desc "migração csv"
  task :treta => :environment do

    @index = 0

    CSV.foreach("lib/files/complemento.csv", :col_sep => "#") do |row|

       @address = Juridical::Complement.new(
       distribution_date: row[5],
       legal_advice_id: row[2],
       deadline: row[7],
       lawsuit_id: row[12],
       instancy_place_id: row[4],
       days: row[6],
       document_type_id: row[3],
       responsible_lawyer_id: row[8],
       status: row[9].to_i == 0 ? "False" : "true",
       advice_type_id: row[11],
       staff_id: row[0].to_i,
       created_at: row[1],
       updated_at: row[10],
       )

      begin
        @address.save
        #puts @address.inspect
        puts @index
      rescue e => Exception
        puts e
      end

      @index += 1

    end
  end
end
