require 'csv'

namespace :candidate do
  desc "migração Cadastros"
  task :dependents => :environment do
    @index = 0
    CSV.foreach("lib/files/dependents_2.csv", :col_sep => "#") do |row|
      @index += 1

      #if @index > 300_000
        @dependent = Candidate::Dependent.new({
          name: row[0].to_s.strip.upcase,
          cpf:  row[1].to_s.strip.gsub('.','').gsub('-',''),
          income: row[3],
          born: (Date.strptime(row[4],'%m/%d/%Y') rescue nil),
          kinship_id: row[5],
          cid: row[6],
          special_condition_id: row[7],
          cadastre_id: row[8],
        })

        if @dependent.save
          @mirror = Candidate::DependentMirror.new({
            name: @dependent.name,
            cpf:  @dependent.cpf,
            born: @dependent.born,
            income: @dependent.income,
            kinship_id: @dependent.kinship_id,
            special_condition_id: @dependent.special_condition_id,
            cadastre_mirror_id: @dependent.cadastre_id,
            cadastre_id: @dependent.cadastre_id,
            dependent_id: @dependent.id,
            cid: @dependent.cid
          })

          @mirror.save
        end

        puts @index
    end
  end
end