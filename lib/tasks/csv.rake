require 'csv'
require "open-uri"

namespace :csv do
  desc "migração de log"
  task :log => :environment do 
    
    @index = 1

    CSV.foreach("lib/files/log3.csv", :col_sep => "#") do |row|

      @model = Candidate::CadastreActivity.new({
        cadastre_id: row[0],
        observation: row[1],
        created_at: row[2],
        staff_id: row[3],
        type_activity: 2,
        type_ocurrency: 1,
        status: true,
        activity_status_id: 8
      })
      
      begin
        @model.save
        #puts @model.inspect
      rescue
        puts "EROOOOOOOREOROEOROEROEOROEOROEOROEOER #{@index}"
      end
      
      @index += 1
    end
  end

end
