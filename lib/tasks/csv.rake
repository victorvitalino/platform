require 'csv'

namespace :csv do
  desc "migração csv"
  task :treta => :environment do

    @index = 0

    CSV.foreach("lib/files/indicacao_30_03_16.csv", :col_sep => "#") do |row|

        #cpf = ''
        #if row[2].to_s.strip.present?
         #cpf = row[2].to_s.gsub('.','')
         #cpf = cpf.gsub('-','')
        #end

       @address = Firm::EnterpriseCadastre.new({
          enterprise_id:  row[3],
          cadastre_id:  row[0],
          status:  row[4],
          source_list: row[2],
          created_at: row[1],

        })
        #if row[2].to_i != 0

          #@assessment = Protocol::Assessment.find(row[2].to_i)

          #if !@address.nil?
            #@assessment.address = row[1]
            @address.save
            #puts @address.inspect
            puts @index
          #end

          @index += 1
       #end
    end
  end
end
