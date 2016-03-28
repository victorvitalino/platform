require 'csv'

namespace :candidate do
  task :refresh_view => :environment do 
    connection = ActiveRecord::Base.connection
    begin
      connection.execute("REFRESH MATERIALIZED VIEW general_pontuations")
      puts "Refresh view complete"
    rescue 
      puts "Refresh view failed"
    end
  end

  task :position => :environment do 

    #Rake::Task["candidate:refresh_view"].invoke
    
    begin 
      Rake::Task["candidate:rii"].invoke
      puts "RII complete"
    rescue
      puts "RII error"
    end

    begin
      Rake::Task["candidate:rie"].invoke
      puts "RIE complete"
    rescue
      puts "RIE error"
    end

    begin
      Rake::Task["candidate:special"].invoke
      puts "SPECIAL complete"
    rescue
      puts "SPECIAL error"
    end

    begin
      Rake::Task["candidate:old"].invoke
      puts "OLD complete"
    rescue
      puts "OLD error"
    end
    
    begin
      Rake::Task["candidate:vulnerable"].invoke
      puts "VULNERABLE complete"
    rescue
      puts "VULNERABLE error"
    end

  end

  task :rii => :environment do
    
    %w(0_1600_1 1601_3275_2 3276_5000_3 5001_99999_4).each do |w|
      income = w.underline_array
      sql = "program_id =  1 AND situation_status_id = 4 
            AND convocation_id > 1524 
            AND procedural_status_id IN(14, 72) 
            AND income BETWEEN #{income[0]} AND #{income[1]}"
      
      @candidates = Candidate::View::GeneralPontuation.where(sql).order('total DESC')

      @candidates.each_with_index do |candidate, index|
        @position = Candidate::Position.new({
          cadastre_id: candidate.id,
          pontuation_id: candidate.pontuation_id,
          position: index + 1,
          program_id: 1,
          zone: income[2],
          created_at: Date.parse('27/03/2016')
        })
        @position.save

        puts index + 1
      end
    end
    
  end

  task :rie => :environment do

    %w(0_1600_1 1601_3275_2 3276_5000_3 5001_99999_4).each do |w|
      income = w.underline_array
      sql = "program_id =  2 AND situation_status_id = 4 
            AND convocation_id > 1524 
            AND procedural_status_id IN(14, 72) 
            AND income BETWEEN #{income[0]} AND #{income[1]}"
      
      @candidates = Candidate::View::GeneralPontuation.where(sql).order('total DESC')

      @candidates.each_with_index do |candidate, index|
        @position = Candidate::Position.new({
          cadastre_id: candidate.id,
          pontuation_id: candidate.pontuation_id,
          position: index + 1,
          program_id: 2,
          zone: income[2],
          created_at: Date.parse('27/03/2016')
        })
        @position.save

        puts index + 1
      end
    end
  end

  task :special => :environment do

    %w(0_1600_1 1601_3275_2 3276_5000_3 5001_99999_4).each do |w|
      income = w.underline_array
      sql = "(special_condition_id in (2,3) or (select COUNT(*)
             from candidate_dependents
             where special_condition_id in (2,3)
             and cadastre_id = general_pontuations.id) > 0)
             and situation_status_id = 4
             and convocation_id > 1524
             and procedural_status_id IN(14, 72)
             and income BETWEEN #{income[0]} AND #{income[1]}"
      
      @candidates = Candidate::View::GeneralPontuation.where(sql).order('total DESC')

      @candidates.each_with_index do |candidate, index|
        @position = Candidate::Position.new({
          cadastre_id: candidate.id,
          pontuation_id: candidate.pontuation_id,
          position: index + 1,
          program_id: 5,
          zone: income[2],
          created_at: Date.parse('27/03/2016')
        })
        @position.save

        puts index + 1
      end
    end
  end

  task :old => :environment do 
               
    %w(0_1600_1 1601_3275_2 3276_5000_3 5001_99999_4).each do |w|
      income = w.underline_array
      sql = "extract(year from age(born)) >= 60 
            AND convocation_id > 1524 
            AND procedural_status_id IN(14, 72) 
            AND situation_status_id = 4
            AND income BETWEEN  #{income[0]} AND #{income[1]}"
      
      @candidates = Candidate::View::GeneralPontuation.where(sql).order('total DESC')

      @candidates.each_with_index do |candidate, index|
        @position = Candidate::Position.new({
          cadastre_id: candidate.id,
          pontuation_id: candidate.pontuation_id,
          position: index + 1,
          program_id: 7,
          zone: income[2],
          created_at: Date.parse('27/03/2016')
        })
        @position.save

        puts index + 1
      end
    end
  end

  task :vulnerable => :environment do 

    %w(0_1600_1 1601_3275_2 3276_5000_3 5001_99999_4).each do |w|
      income = w.underline_array
      sql = "program_id =  4 AND situation_status_id = 4 
            AND convocation_id > 1524 
            AND procedural_status_id IN(14, 72) 
            AND income BETWEEN #{income[0]} AND #{income[1]}"
      
      @candidates = Candidate::View::GeneralPontuation.where(sql).order('total DESC')

      @candidates.each_with_index do |candidate, index|
        @position = Candidate::Position.new({
          cadastre_id: candidate.id,
          pontuation_id: candidate.pontuation_id,
          position: index + 1,
          program_id: 4,
          zone: income[2],
          created_at: Date.parse('27/03/2016')
        })
        @position.save

        puts index + 1
      end
    end
  end
end