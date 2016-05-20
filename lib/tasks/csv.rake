require 'csv'
require "open-uri"

namespace :csv do

  desc "migração de log"
  task :log => :environment do

    @index = 0

    CSV.foreach("lib/files/criterios.csv", :col_sep => "#") do |row|


           @model = Candidate::Convocation.find_by_id(row[0])

           if @model.present?
             @model.criteria = row[1]

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
