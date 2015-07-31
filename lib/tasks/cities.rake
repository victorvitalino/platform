require 'net/http'
require 'net/https' # for ruby 1.8.7
require 'json'
require 'csv'

module BRPopulate
  def self.states
    http = Net::HTTP.new('raw.githubusercontent.com', 443); http.use_ssl = true
    JSON.parse http.get('/codhab/plataform/master/lib/files/cities.json').body
  end

  def self.capital?(city, state)
    city["name"] == state["capital"]
  end

  def self.populate
    states.each do |state|
      state_obj = Address::State.new(:acronym => state["acronym"], :name => state["name"])
      state_obj.save
      
      state["cities"].each do |city|
        c = Address::City.new
        c.name = city
        c.state = state_obj
        c.capital = capital?(city, state)
        c.save
      end
    end
  end
end


namespace :cities do
  desc "migração de cidades"
  task :migrate => :environment do
    BRPopulate.populate
  end

  desc 'migração de endereços parcial'
  task :migrate_address => :environment do 
    CSV.foreach("lib/files/endereco_parcial.csv", :col_sep => ";") do |row|
      @unit = Address::Unit.new
      @unit.city_id = row[0]
      @unit.block   = row[2] 
      @unit.group   = row[4]
      @unit.unit    = row[5]
      @unit.program = row[16]
      @unit.complete_address = row[9]
      @unit.save
    end
  end
end