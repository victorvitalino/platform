require 'csv'

namespace :cms do

  desc "migração posts"
  task :posts => :environment do
    @index = 0
    
    CSV.foreach("lib/files/migrate/current/cms_posts.csv", :col_sep => "#") do |row|

      begin
        @post = Person::Staff.new
        @post.name             = row[0].to_s.strip.downcase
      if @post.save!
        @index = @index + 1 
        puts @index
      end

      rescue Exception => e
        puts "ERROR- #{e}"
      end
    end
  end

  desc "migração posts_categories"
  task :post_categories => :environment do
    @index = 0
    
    CSV.foreach("lib/files/migrate/current/cms_post_categories.csv", :col_sep => "#") do |row|

      begin
        @post = Person::Staff.new
        @post.name             = row[0].to_s.strip.downcase
      if @post.save!
        @index = @index + 1 
        puts @index
      end

      rescue Exception => e
        puts "ERROR- #{e}"
      end
    end
  end


  desc "migração pages"
  task :pages => :environment do
    @index = 0
    
    CSV.foreach("lib/files/migrate/current/cms_posts.csv", :col_sep => "#") do |row|

      begin
        @post = Person::Staff.new
        @post.name             = row[0].to_s.strip.downcase
      if @post.save!
        @index = @index + 1 
        puts @index
      end

      rescue Exception => e
        puts "ERROR- #{e}"
      end
    end
  end

  desc "migração page_categories"
  task :page_categories => :environment do
    @index = 0
    
    CSV.foreach("lib/files/migrate/current/cms_page_categories.csv", :col_sep => "#") do |row|

      begin
        @post = Person::Staff.new
        @post.name             = row[0].to_s.strip.downcase
      if @post.save!
        @index = @index + 1 
        puts @index
      end

      rescue Exception => e
        puts "ERROR- #{e}"
      end
    end
  end


  desc "migração cms_redactor_assets"
  task :redactor => :environment do
    @index = 0
  
    CSV.foreach("lib/files/migrate/current/cms_redactor_assets.csv", :col_sep => "#") do |row|

      begin
        @post = Person::Staff.new
        @post.name             = row[0].to_s.strip.downcase
      if @post.save!
        @index = @index + 1 
        puts @index
      end

      rescue Exception => e
        puts "ERROR- #{e}"
      end
    end
  end

end
