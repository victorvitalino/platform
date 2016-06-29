require 'csv'
require "open-uri"

namespace :update do

  task :firm => :environment do


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
