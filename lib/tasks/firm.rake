require 'csv'

namespace :firm do
  desc "migração Cadastros"
  task :firms => :environment do
    @index = 0
    CSV.foreach("lib/files/firms.csv", :col_sep => ";") do |row|
      
      @index += 1

      @firm = Firm::Company.new({
        name: row[0],
        cnpj: row[1],
        telephone: row[2],
        telephone_optional: row[3],
        email: row[4],
        address: row[5],
        city_id: row[6],
        trade: row[7]
      })

      if @firm.save
        puts @index
      else
        puts "CORRE NEGADA"
      end
    end
  end
end