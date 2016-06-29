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

end
