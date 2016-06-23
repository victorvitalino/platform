require 'csv'
require "open-uri"

namespace :update do

  desc "migração de log"
  task :firm => :environment do

    @index = 0


    CSV.foreach("lib/files/conduct.csv", :col_sep => "#") do |row|


           @model = Protocol::Conduct.new(
           conduct_type: 0,
           assessment_id: row[2],
           sector_id: row[3],
           staff_id: row[4],
           allotment_id: row[0],
           created_at: row[1],
           )

          #puts @model.inspect

          @model.save



          #    puts "EROOOOOOOREOROEOROEROEOROEOROEOROEOER #{@index}"
          #  end

       puts  @index += 1

    end
  end

end
