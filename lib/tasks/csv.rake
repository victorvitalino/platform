require 'csv'
require "open-uri"

namespace :csv do

  desc "migração de log"
  task :log => :environment do

    @index = 0

    CSV.foreach("lib/files/lote.csv", :col_sep => "#") do |row|

      @lift = Address::Unit.find_by_control_number(row[0])

      if @lift.present?
        #puts l.cnpj
        @lift.situation_unit_id = row[1]
        @lift.save
      end
      #puts @lift.inspect
     puts @index += 1

    end
  end

end
