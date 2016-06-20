require 'csv'
require "open-uri"

namespace :update do

  desc "migração de log"
  task :firm => :environment do

    @index = 0


    CSV.foreach("lib/files/conduct2.csv", :col_sep => "#") do |row|


           @model = Protocol::Conduct.new(
           conduct_type: row[2].to_i,
           assessment_id: row[3],
           staff_id: row[5],
           sector_id: row[4],
           allotment_id: row[0],
           created_at: row[1]
           )

          #puts @model.inspect

          @model.save



          #    puts "EROOOOOOOREOROEOROEROEOROEOROEOROEOER #{@index}"
          #  end

       puts  @index += 1

    end
  end

end
