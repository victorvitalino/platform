require 'csv'

namespace :person do

  desc "migração Staffs"
  task :staffs => :environment do
    @index = 0
    @error = Array.new
    CSV.foreach("lib/files/staffs.csv", :col_sep => ",") do |row|

      begin
      @staff = Person::Staff.new
      @staff.name             = row[0].to_s.strip.upcase
      @staff.cpf              = row[1].to_s.gsub('.', '').gsub('-','')
      @staff.rg               = row[2]
      @staff.rg_org           = row[3]
      @staff.code             = row[4].to_s.strip.downcase
      @staff.blood_type       = row[5]
      @staff.born             = row[6]
      @staff.email            = row[7].to_s.strip.downcase
      @staff.start_hour       = Time.parse("#{row[8]}:00")
      @staff.end_hour         = Time.parse("#{row[9]}:00")
      @staff.date_contract    = row[10]
      @staff.date_shutdown    = row[11]
      @staff.created_at       = row[12]
      @staff.sector_current_id   = row[13]
      
      @staff.status               = (row[14] == "2") ? 1 : row[14]
      @staff.wekeend              = row[15]
      
      @staff.job_id               = row[16]
      @staff.sector_origin_id     = row[17]
     

      if @staff.valid?
        @staff.build_user(username: @staff.code, password: '12345678', password_confirmation: '12345678')
        @staff.save
        @index = @index + 1 
        puts @index
     
      else
        @staff.code = "F#{@staff.code}"
        @staff.build_user(username: @staff.code, password: '12345678', password_confirmation: '12345678')
        @staff.save
      end

      rescue Exception => e
        puts "ERROR- #{e}"
      end
    end
  end

  task :sectors => :environment do
    @index = 0
    CSV.foreach("lib/files/sectors.csv", :col_sep => "#") do |row|
      @sector = Person::Sector.new
      
      @sector.name    = row[0].to_s.strip.upcase
      @sector.acron   = row[1] 
      @sector.prefex  = row[2]
      @sector.status  = row[3]
     
      @index = @index + 1
      
      begin
        @sector.save!
        puts @index
      rescue Exception => e
        puts "ERROR- #{e}"
      end
    end

  end

  task :jobs => :environment do

    @index = 0
    CSV.foreach("lib/files/migrate/current/person_jobs.csv", :col_sep => ";") do |row|
      @job = Person::Job.new
      
      @job.name    = row[0].to_s.strip.downcase
      @job.status  = row[1] 
      

      if @job.save!
        @index = @index + 1
        puts @index
      end
    end
  end
end