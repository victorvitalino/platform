require 'csv'

namespace :migrate do

  desc "migração Person"
  task :staff => :environment do
    @index = 0
    @error = Array.new
    CSV.foreach("lib/files/migrate/#{ENV['DATE_MIGRATE']}/person_staff.csv", :col_sep => ";") do |row|

      begin
      @staff = Person::Staff.new
      @staff.name             = row[0].to_s.strip.downcase
      @staff.code             = row[1].to_s.strip.downcase
      @staff.email            = row[4].to_s.strip.downcase
      @staff.status           = row[5]
      
      @staff.created_at       = row[3]
      puts row[6]
      @staff.start_hour       = Time.parse("#{row[6]}:00")
      @staff.end_hour         = Time.parse("#{row[7]}:00")
     
      @staff.wekeend          = false
      @staff.born             = row[9]
      @staff.job_id           = row[10]
      @staff.rg               = row[11]
      @staff.rg_org           = row[12]
      @staff.cpf              = row[13].to_s.gsub('.', '').gsub('-','')
      @staff.date_contract    = row[14]
      @staff.date_shutdown    = row[15]
      @staff.blood_type       = row[16]
      @staff.sector_current_id   = row[17]
      @staff.sector_origin_id    = row[18]

      @staff.build_user(username: @staff.code, password: '12345678', password_confirmation: '12345678')

      rescue Exception => e
      
        puts "È CULPA DO COTA - #{e} - CARLINHO É UM VIADO"
      end
      
      begin
        if @staff.save!
          @index = @index + 1
          puts "SSAÊ MERMAO | #{@index}"
        else
          puts "CULPA DO COTA"
        end
      rescue
        puts "DEU ERRO FILHA DA MÃE, DEU ERRO, ERROOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO"
      end
    end
  end

  task :sector => :environment do
    @index = 0
    @error = Array.new
    CSV.foreach("lib/files/migrate/#{ENV['DATE_MIGRATE']}/person_sector.csv", :col_sep => ";") do |row|
      @sector = Person::Sector.new
      
      @sector.name    = row[0].to_s.strip.downcase
      @sector.acron   = row[1] 
      @sector.status  = row[2]
      @sector.prefex  = row[3]
     
      begin
        if @sector.save
          @index = @index + 1
          puts "REGISTRO FOI INSERIDO MANO | #{@sector.name} | INDEX #{@index}"
        end
      rescue
        @error << @sector.name
        puts "REGISTRO NÃO FOI INSERIDO, VEJA ESSA RESENHA AI"
      end
    end

    puts @error if @error.count > 0
  end

  task :job => :environment do
    @index = 0
    @error = Array.new
    CSV.foreach("lib/files/migrate/#{ENV['DATE_MIGRATE']}/person_job.csv", :col_sep => ";") do |row|
      @job = Person::Job.new
      
      @job.name    = row[0].to_s.strip.downcase
      @job.status  = row[1] 
      
      if @job.save!
        @index = @index + 1
        puts "REGISTRO FOI INSERIDO MANO | #{@job.name} | INDEX #{@index}"
      end
    end

    puts @error if @error.count > 0
  end


  desc "migração Protocol"
  task :subjects => :environment do 
  end
  
  task :document_types => :environment do 
  end


  desc "migração Cms"
  task :pages => :environment do 
  end

  task :posts => :environment do 
  end


  desc "migração Address" 
  task :units => :environment do 
  end

end