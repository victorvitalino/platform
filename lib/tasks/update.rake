require 'csv'
require "open-uri"

namespace :update do

  desc "migração de log"
  task :firm => :environment do

    @index = 0


    CSV.foreach("lib/files/address.csv", :col_sep => "#") do |row|


           #@model = Candidate::CadastreProcedural.new(
           #cadastre_id: row[1],
           #procedural_status_id: row[4],
           #convocation_id: row[3],
           #old_process: row[6],
           #ransfer_process: row[7],
           #created_at: row[5]
           #)

          #puts @model.inspect

          @model = Candidate::CadastreAddress.find_by_unit_id(row[2])

          if @model.present?
            @model.cadastre_id = row[0]

            @model.save
            #puts @model.inspect
          end



          #@model.save



          #    puts "EROOOOOOOREOROEOROEROEOROEOROEOROEOER #{@index}"
          #  end

       puts  @index += 1

    end
  end

end
