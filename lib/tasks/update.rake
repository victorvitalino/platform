require 'csv'
require "open-uri"

namespace :update do

  desc "migração de log"
  task :firm => :environment do

    @index = 0


    CSV.foreach("lib/files/log10.csv", :col_sep => "#") do |row|


           @model = Candidate::CadastreActivity.new(
           staff_id: row[3],
           cadastre_id: row[2],
           activity_status_id: row[4],
           type_activity: row[5].to_i,
           type_ocurrency: row[6].to_i,
           observation: row[0].to_s.strip,
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
