require 'csv'

namespace :cms do

  desc "migração posts"
  task :posts => :environment do
  end

  desc "migração posts_categories"
  task :post_categories => :environment do
  end


  desc "migração pages"
  task :pages => :environment do
  end

  desc "migração page_categories"
  task :page_categories => :environment do
  end


  desc "migração cms_redactor_assets"
  task :redactor => :environment do
  end

end
