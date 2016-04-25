require 'csv'
require "open-uri"

namespace :update do

  desc "migração de log"
  task :firm => :environment do

    @index = 0

    CSV.foreach("lib/files/indicados_22_04_2016.csv", :col_sep => "#") do |row|


           @model = Firm::EnterpriseCadastre.new(
           enterprise_id: row[1],
           cadastre_id: row[0],
           status: true,
           created_at: row[2],
           source_list: row[4]
           )


          begin
            @model.save
            #puts @model.inspect
          rescue
            puts "EROOOOOOOREOROEOROEROEOROEOROEOROEOER #{@index}"
          end


       puts  @index += 1

    end
  end

end
