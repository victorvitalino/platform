require 'csv'
require "open-uri"

namespace :update do

  desc "migração de log"
  task :firm => :environment do

    @index = 0


    CSV.foreach("lib/files/escritura.csv", :col_sep => "#") do |row|


           @model = Candidate::CadastreActivity.new(
           cadastre_id: row[0],
           activity_status_id: 12,
           type_activity: 0,
           status: true,
           type_ocurrency: 1,
           observation: "Escritura física na CODHAB"
           )

          #puts @model.inspect
          @model.save



          #    puts "EROOOOOOOREOROEOROEROEOROEOROEOROEOER #{@index}"
          #  end

       puts  @index += 1

    end
  end

end
