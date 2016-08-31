require 'nokogiri'         
require 'open-uri'
require 'correios-cep'
require 'csv'

namespace :crawler do

  task :zipcode => :environment do
    
    Entity::Cadastre.select(:id, :cep).each do |item|
      
      @cep    = item.cep.to_s.gsub('-','').gsub(' ', '').strip
      @id     = item.id
      
      page    = Nokogiri::HTML(open("http://www.cepaberto.com/api/v2/ceps.json?cep=#{@cep}"))
      html    = page.css('.resultado-buscacep p')
      p_array = html[0].to_s.split('<br>')

      p_array.each do |line|
        @lat = line.gsub('<b>Latitude:</b>', '').to_s.strip!  if line.include? 'Latitude'
        @lng = line.gsub('<b>Longitude:</b>', '').to_s.strip! if line.include? 'Longitude'
      end

      puts "#{@cep};#{@id};#{@lat};#{@lng}"
    end
  end

  task :zipcode_test => :environment do 


    Entity::Cadastre.all.each_with_index do |item, index|
      
      puts index
      @cep = item.cep.to_s.gsub('-', '').gsub(' ', '').gsub('.', '').strip

      puts @cep

      finder  = Correios::CEP::AddressFinder.new
      address = finder.get("#{@cep}") rescue nil

      if !address.nil?
        geocode = Geocoder.coordinates("#{address[:address]}, #{address[:neighborhood]}, #{address[:state]}")
      else 
        geocode = nil 
      end

      if geocode.present?
        item.lat     = geocode[0]
        item.lng     = geocode[1]
        
        item.save
      else
        puts "ERROR"
      end

    end
  end

  task :update_situation => :environment do 
    CSV.foreach("lib/entities.csv", :col_sep => "#") do |row|

      @cnpj = "#{'%014d' % row[0].to_i}"
      @entity = Entity::Cadastre.find_by_cnpj(@cnpj) rescue nil
      
      if @entity.present?
        if row[1] == "CREDENCIADA"
          @entity.situation_id = 1
        else
          @entity.situation_id = 0
        end

        @entity.save

        puts @entity.cnpj
      end
      puts @cnpj
    end
  end

end