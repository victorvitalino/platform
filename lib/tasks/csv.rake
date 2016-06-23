require 'csv'
require "open-uri"

namespace :csv do

  desc "migração de log"
  task :log => :environment do

    @index = 0

    CSV.foreach("lib/files/geo_entity.csv", :col_sep => "#") do |row|

      @lift = Entity::Old.find_by_cnpj(row[0].strip) rescue nil

      if @lift.present?
        @lift.lat       = row[1].to_s
        @lift.long      = row[2].to_s
        @lift.save
      end

    end
  end

end
