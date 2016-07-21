require 'csv'
require "open-uri"

namespace :update do

  desc "migração de log"
  task :firm => :environment do

    @index = 0

<<<<<<< HEAD

     CSV.foreach("lib/files/listagem.csv", :col_sep => "#") do |row|


           @teste = Sefaz::Exemption.new(
           name: row[2],
           cpf: row[3].gsub('.','').gsub('-',''),
           city: row[4],
           address: row[5].strip,
           realty_number: row[6],
           realty_value: row[7],
           allotment_id: row[0],
           created_at: row[9],
           act_number: row[8].to_s == "NULL" ? nil :row[8],
           unitary: false,
           )

           #puts @teste.inspect
           @teste.save

           puts @index += 1
       end
          #    puts "EROOOOOOOREOROEOROEROEOROEOROEOROEOER #{@index}"
          #  end



    #select cnpj from protocol_assessments where cnpj is not null and length(cnpj) = 13

=======
    CSV.foreach("lib/files/geo3.csv", :col_sep => "#") do |row|
      address = row[0].split(' ')
      block   = "#{address[0]} #{address[1]}"
      group   = address[3]
      unit    = address[5]
      
      coord   = row[1].split('-----------')

      @address = Address::Unit.where(urb: "ETAPA 4C", block: block, group: group, unit: unit).first
      
      if coord.count == 2 && @address.present?
        @address.lat = coord[0]
        @address.lng = coord[1]
        @address.save
      end

    end
>>>>>>> 2ac4dbda3d4bdf31c3dce23e1762498cfe9beb49
  end
end
