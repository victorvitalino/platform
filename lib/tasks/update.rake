require 'csv'
require "open-uri"

namespace :update do

  desc "migração de log"
  task :firm => :environment do

    @index = 0


    CSV.foreach("lib/files/log_mangueiral.csv", :col_sep => "#") do |row|


           @model = Candidate::EnterpriseCadastreSituation.new(
           enterprise_cadastre_id: row[5],
           enterprise_cadastre_status_id: row[3],
           observation: row[2],
           file_path: row[4],
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
