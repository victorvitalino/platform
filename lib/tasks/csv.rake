require 'csv'
require "open-uri"

namespace :csv do

  desc "migração de log"
  task :log => :environment do

    @index = 0

    #CSV.foreach("lib/files/update.csv", :col_sep => "#") do |row|

      @lift = Protocol::Assessment.where("length(cnpj) > 14")

      @lift.each do |l|
        #puts l.cnpj
        l.cnpj = l.cnpj.gsub('.','').gsub('/','').gsub('-','')
        @assessment = Protocol::Assessment.find(l.id)
        @assessment.cnpj = l.cnpj
        @assessment.save
        puts l.cnpj
      end
      #puts @lift.count


    #end
  end

  task :lat_fix => :environment do 

    @address = Address::Unit.where(urb:'ETAPA 4C', block: ['QN 18', 'QN 19', 'QN 20'])
    
    @address.each do |addr|
      @lat = addr.lat
      @lng = addr.lng
      @latlng = "#{addr.lat},#{addr.lng}"

      addr.update(coordinate: @latlng)
    end  
  end

end
