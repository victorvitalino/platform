require 'csv'

namespace :csv do
  desc "migração csv"
  task :treta => :environment do

    @index = 0

    CSV.foreach("lib/files/entiades_status.csv", :col_sep => "#") do |row|

       @address = Entity::Old.where(cnpj: row[0]).first

        if @address.present?
          @address.old = row[1]

          begin
            @address.save
            #puts @address.inspect
            puts @index
          rescue e => Exception
            puts e
          end

          @index += 1

      else
        puts 'não encontrado'
     end
    end
  end
end
