require 'csv'

namespace :csv do
  desc "migração csv"
  task :treta => :environment do

    @index = 0

    CSV.foreach("lib/files/complemento.csv", :col_sep => "#") do |row|

       @address = Juridical::Complement.new(
       complement: row[0],
       distribution_date: row[6],
       legal_advice_id: row[3],
       deadline: row[8],
       lawsuit_id: row[13],
       instancy_place_id: row[5],
       days: row[7],
       document_type_id: row[4],
       responsible_lawyer_id: row[9],
       status: row[10],
       advice_type_id: row[12],
       staff_id: row[1].to_i,
       created_at: row[2],
       updated_at: row[11],
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
