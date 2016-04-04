require 'csv'

namespace :csv do
  desc "migração csv"
  task :treta => :environment do

    @index = 0

    CSV.foreach("lib/files/inscrito_entidade.csv", :col_sep => "#") do |row|

      @cadastre = Candidate::Cadastre.find_by_cpf(row[0].to_s.gsub('.','').gsub('-','')) rescue nil
      @entity   = Entity::Old.find_by_cnpj(row[1]) rescue nil

      if @cadastre.present? && @entity.present?

        @old = Entity::OldCandidate.new({
          cadastre_id: @cadastre.id,
          old_id: @entity.id
        })
        
        begin 
          @old.save
          #puts @old.inspect
          puts @index
        rescue e => Exception
          puts e
        end

        @index += 1

      else
        puts 'não encontrado'
      end
    end
  end
end
