require 'csv'
require "open-uri"

namespace :update do

  desc "migração de log"
  task :firm => :environment do

    @index = 0


    CSV.foreach("lib/files/log1.csv", :col_sep => "#") do |row|


           @model = Candidate::CadastreActivity.new(
           cadastre_id: row[3],
           staff_id: row[2],
           activity_status_id: 4,
           type_activity: 3,
           status: true,
           type_ocurrency: 1,
           observation: row[0],
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
