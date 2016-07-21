require 'csv'
require "open-uri"

namespace :update do

  desc "migração de log"
  task :firm => :environment do

    @index = 0

    CSV.foreach("lib/files/geo5.csv", :col_sep => "#") do |row|
      address = row[0].split(' ')
      block   = "#{address[0]} #{address[1]}"
      group   = address[3]
      unit    = address[5]
      
      coord   = row[1].split('-----------')

      @address = Address::Unit.where(urb: "ETAPA 4C", block: block, group: group, unit: unit).first
      byebug
      if coord.count > 2 && @address.present?
        @address.lat = coord[0]
        @address.lng = coord[1]
        byebug
        #@address.save
      end

    end
  end

  task :field => :environment do 
    
    @address = Address::Unit.where(urb: 'ETAPA 4C')

    @address.each do |addr|
      @lat = addr.lat
      @lng = addr.lng

      addr.coordinate = "#{addr.lat},#{addr.lng}"
      addr.save
    end
  end

  task :ammvs => :environment do 

    @index = 0

    CSV.foreach("lib/files/ammvs2.csv", :col_sep => "#") do |row|
      
      
      address = row[3].gsub(',','')
      
      

=begin
      address2 = row[4].split(' ')
      address2 = "#{address2[0]} #{address2[1]} #{address2[2]} 0#{address2[3]}"
      address = "#{row[3]} #{address2}"

      address_split   = row[3].split(" ")
      address_compose = "#{address_split[0]} #{address_split[1]} #{address_split[2]} 0#{address_split[3]}"

      address = "#{address_compose} CS #{'%04d' % row[4].to_i}"
      
=end

      cpf = row[0].to_s.unformat_cpf
      cpf = "#{'%011d' % cpf.to_i}"

      unit = Address::Unit.where(urb: 'ETAPA 4C').find_by_complete_address(address.strip).id rescue address
      cadastre = Candidate::Cadastre.find_by_cpf(cpf).id rescue nil

      puts unit

      @ammvs = Candidate::Ammv.new({
        cpf:                 cpf,
        name:             row[1],
        address:          row[3],
        unit:             row[4],
        singnature_date:  row[5],
        register_date:    row[6],
        constructor:      row[7],
        finance_agent:    row[9],
        cdru:             row[10],
        cdru_observation: row[11],
        cadastre_id: cadastre,
        unit_id: unit,
        index_migrate: 13
      })
      @ammvs.save
    end

  end
end
