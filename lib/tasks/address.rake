require 'csv'
require 'net/http'
require 'net/https' # for ruby 1.8.7
require 'json'

module BRPopulate
  def self.states
    JSON.parse File.read('lib/files/migrate/current/address_cities.json')
  end

  def self.capital?(city, state)
    city["name"] == state["capital"]
  end

  def self.populate
    states.each do |state|
      state_obj = Address::State.new(:acronym => state["acronym"], :name => state["name"])
      state_obj.save!
      
      state["cities"].each do |city|
        c = Address::City.new
        c.name = city
        c.state = state_obj
        c.capital = capital?(city, state)
        c.save!
      end
    end
  end
end

namespace :address do

  desc "Migração de cidades"
  task :cities => :environment do
    BRPopulate.populate
  end



  desc "Migração de endereços"
  task :units => :environment do
    @index = 0
   
    CSV.foreach("lib/files/migrate/current/address_units.csv") do |row|

      begin
        @unit = Address::Unit.create({
          city_id:            row[1],
          acron_block:        row[2].to_s.upcase.strip,
          block:              row[3].to_s.upcase.strip,
          acron_group:        row[4].to_s.upcase.strip,
          group:              row[5].to_s.upcase.strip,
          unit:               row[6].to_s.upcase.strip,
          cep_unit:           row[7],
          area:               row[9].to_s.upcase.strip,
          complete_address:   row[10].to_s.upcase.strip,
          sefaz:              row[11],
          donate:             row[12],
          date_iptu:          row[13],
          registration_iptu:  row[14],
          certificate:        row[15],
          situation_unit_id:  row[16],
          program:            row[17]

        })
        

        puts @index
      @index = @index + 1

      rescue Exception => e
        puts "ERROR - #{e}"
      end
      
    end
  
  end



  desc "Migração de registros"

  task :registry_units => :environment do
    @index = 0
   
    CSV.foreach("lib/files/migrate/current/address_registry_units.csv", :col_sep => "#") do |row|

      begin
        @unit = Address::RegistryUnit.create({
          situation:  row[1],
          unit_id:    row[0],
          status:     true
        })
        

      puts @index
      @index = @index + 1

      rescue Exception => e
        puts "ERROR - #{e}"
      end
      
    end
  
  end


  desc "Migração de situação de unidade"

  task :situation_unit => :environment do
    
    @situation = Address::SituationUnit.create([
      {description: "imóvel vago", status: true},
      {description: "emitir tcu", status: true},
      {description: "imóvel distribuido", status: true},
      {description: "regularização TERRACAP", status: true},
      {description: "imóvel interditado", status: true},
      {description: "imóvel reservado", status: true},
      {description: "imóvel retomado (em processo)", status: true},
      {description: "fixação SHB Q 02 - SOBRADINHO II", status: true},
      {description: "imóvel invadido", status: true},
      {description: "imóvel sub judice", status: true},
      {description: "lei 2.731/01 - Decreto 23.592/03 (COMREG)", status: true},
      {description: "cadastramento em depuração", status: true}
    ])

  end


  desc "Migração de Catorios"

  task :notary_offices => :environment do
    @index = 0
    CSV.foreach("lib/files/migrate/current/address_notary_offices.csv", :col_sep => "#") do |row|

      begin
       @situation = Address::NotaryOffice.create({
         unit_code:        row[1],
         office:           row[2],
         date_code:        row[3],
         date_contract:    row[4],
         code_contract:    row[5],
         office_contract:  row[6],
         date_petition:    row[7],
         date_signature:   row[8],
         date_anoreg:      row[9],
         date_devolution:  row[10],
         requeriment:      row[11],
         date_requeriment: row[12],
         declaratory_act_number: row[13],
         rejection_number:       row[14],
         date_act_declaratory: row[15],
         unit_id: row[16]
       })

      puts @index
      @index = @index + 1

      rescue Exception => e
        puts "ERROR - #{e}"
      end
      
    end
  end
end