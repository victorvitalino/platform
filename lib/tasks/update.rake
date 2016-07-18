require 'csv'
require "open-uri"

namespace :update do

  desc "migração de log"
  task :firm => :environment do

    @index = 0

    CSV.foreach("lib/files/geo.csv", :col_sep => "#") do |row|
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
  end
end
