require 'csv'
require "open-uri"

namespace :update do

  desc "migração de log"
  task :firm => :environment do

    @index = 0


    CSV.foreach("lib/files/empresa.csv", :col_sep => "#") do |row|


           @model = Candidate::EnterpriseCadastreSituation.new(
           enterprise_cadastre_id: row[8],
           enterprise_cadastre_status_id: row[5],
           observation: row[4],
           file_path: row[3],
           firm_user_id: row[6],
           created_at: row[2],

           )

          #puts @model.inspect
          @model.save



          #    puts "EROOOOOOOREOROEOROEROEOROEOROEOROEOER #{@index}"
          #  end

       puts  @index += 1

    end
  end

end
