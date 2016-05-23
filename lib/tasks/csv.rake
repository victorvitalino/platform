require 'csv'
require "open-uri"

namespace :csv do

  desc "migração de log"
  task :log => :environment do

    @index = 0

    CSV.foreach("lib/files/atualizar.csv", :col_sep => "#") do |row|


           @model = Candidate::EnterpriseCadastre.find_by_cadastre_id(row[0])

           if @model.present?
             @model.inactive = true
             @model.inactive_date = row[1]
           end


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
