require 'csv'

namespace :candidate do
  desc "migração Cadastros"
  task :cadastre_situation => :environment do
    @index = 0
    CSV.foreach("lib/files/cadastre_situation_4.csv", :col_sep => "#") do |row|
      @index += 1

      #if @index > 300_000
        @situation = Candidate::CadastreSituation.new({
          cadastre_mirror_id: row[1],
          cadastre_id: row[1],
          situation_status_id: row[0]
        })

        @situation.save

        puts @index
    end
  end

  task :status_situations => :environment do
    @index = 0
    CSV.foreach("lib/files/status_situations.csv", :col_sep => "#") do |row|
      @index += 1

      #if @index > 300_000
        @situation = Candidate::SituationStatus.new({
          name: row[0].to_s.strip.downcase,
          code: @index
        })

        @situation.save

        puts @index
    end
  end


  task :procedural_status => :environment do
    @index = 0
    CSV.foreach("lib/files/procedural_status.csv", :col_sep => "#") do |row|
      @index += 1

      #if @index > 300_000
        @procedural = Candidate::ProceduralStatus.new({
          name: row[0].to_s.strip.downcase,
          code: @index
        })

        @procedural.save

        puts @index
    end
  end
end