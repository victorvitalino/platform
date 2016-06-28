require 'csv'
require "open-uri"

namespace :update do

  desc "migração de log"
  task :preguica_jesus => :environment do

    @all1 = Protocol::Assessment.where('cnpj IS NOT NULL AND length(cnpj) = 13')
    
    @all = Protocol::Assessment.where('cnpj IS NOT NULL')

    @all1.each do |c|
      @e = Protocol::Assessment.find(c.id) rescue nil
      if @e.present?
        @e.cnpj = "0#{c.cnpj}"
        @e.save
        puts @e.cnpj
      end
    end

    @all.each do |a|
      @b = Protocol::Assessment.find(a.id) rescue nil

      if @b.present?
        @b.cnpj = a.cnpj.gsub('.','').gsub('/','').gsub('-','')
        @b.save
        puts @b.cnpj
      end
    end
    
    puts "JESUS PREGUIÇOSO"
    #select cnpj from protocol_assessments where cnpj is not null and length(cnpj) = 13
  end

end
