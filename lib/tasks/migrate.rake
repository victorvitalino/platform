require 'csv'

namespace :migrate do

  desc "migração Person"
  task :staff => :environment do
    @index = 0
    @error = Array.new
    CSV.foreach("lib/files/migrate/#{ENV['DATA_MIGRATE']}/person_staff.csv", :col_sep => ";") do |row|
      @staff = Person::Staff.new
      @staff.name             = row[0].to_s.strip.downcase
      @staff.code             = row[1].to_s.strip.downcase
      @staff.email            = row[3].to_s.strip.downcase
      @staff.status           = row[4]
      
      @staff.start_hour       = Time.parse("#{row[5]}:00")
      @staff.end_hour         = Time.parse("#{row[6]}:00")
     
      @staff.wekeend          = row[7]
      @staff.born             = row[8]
      @staff.job_id           = row[9]
      @staff.rg               = row[10]
      @staff.rg_org           = row[11]
      @staff.cpf              = row[12]
      @staff.date_contract    = row[13]
      @staff.date_contract    = row[13]
      @staff.date_shudown     = row[14]
      @staff.blood_type       = row[15]
      @staff.sector_current   = row[16]
      @staff.sector_origin    = row[17]

      @staff.build_user(username: @staff.code, password: row[2], password_confirmation: row[2])

      if @staff.save!
        @index = @index + 1
        puts "SSAÊ MERMAO | #{@index}"
      else
        puts "CULPA DO COTA"
      end
    
    end
  end

  task :sector => :environment do
    @index = 0
    @error = Array.new
    CSV.foreach("lib/files/migrate/#{ENV['DATA_MIGRATE']}/person_sector.csv", :col_sep => ";") do |row|
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
    CSV.foreach("lib/files/migrate/#{ENV['DATA_MIGRATE']}/person_job.csv", :col_sep => ";") do |row|
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