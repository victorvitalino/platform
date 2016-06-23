require 'csv'
require "open-uri"

namespace :csv do

  desc "migração de log"
  task :log => :environment do

    @index = 0

    CSV.foreach("lib/files/entity_cred.csv", :col_sep => "#") do |row|

      @lift = Entity::Old.find_by_cnpj(row[0]) rescue nil

      if @lift.present?
        @lift.address   = row[1].to_s.downcase
        @lift.city      = row[2].to_s.downcase
        @lift.cep       = row[3].to_s.downcase
        @lift.save
      end

    end
  end

end
