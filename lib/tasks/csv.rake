require 'csv'
require "open-uri"

namespace :csv do
  desc "migração csv"
  task :renda => :environment do

    @index = 0


    CSV.foreach("lib/files/logrenda.csv", :col_sep => "#") do |row|

       @address = Candidate::CadastreActivity.new(
       staff_id: row[1],
       cadastre_id: row[0],
       activity_status_id: row[1],
       staff_id: row[1],
       staff_id: row[1],
       staff_id: row[1],
       staff_id: row[1],
       )

      begin
        @address.save
        #puts @address.inspect
        puts @index
      rescue e => Exception
        puts e

      @index += 1

      puts @index

    end
  end
end
