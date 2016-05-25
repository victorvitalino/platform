require 'csv'
require "open-uri"

namespace :update do

  desc "migração de log"
  task :firm => :environment do

    @index = 0


    CSV.foreach("lib/files/obs_2.csv", :col_sep => "#") do |row|

           #staff = Person::Staff.find_by_code(row[3]).id rescue nil


           @model = Candidate::CadastreActivity.new(
           cadastre_id: row[1],
           activity_status_id: 11,
           type_activity: 0,
           status: true,
           type_ocurrency: 1,
           observation:row[0].strip,

           )

          #puts @model.inspect
          @model.save

        #    puts "EROOOOOOOREOROEOROEROEOROEOROEOROEOER #{@index}"
        #  end


       puts  @index += 1

    end
  end

end
