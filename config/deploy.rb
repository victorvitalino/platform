require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
require 'mina/rvm'
require 'mina/unicorn'

set :term_mode, true

set  :domain,  '10.233.38.15'
set  :user,  'sedhab'

if ENV["DEPLOY"] == "stage"
  set  :deploy_to, '/var/www/stage/platform' 
else
  set  :deploy_to, '/var/www/platform' 
end

set  :repository, 'https://github.com/codhab/platform.git' 
set  :branch, ENV["BRANCH"] ||= 'stable'

set :rails_env, 'production'

set :unicorn_pid, "#{deploy_to}/shared/pids/unicorn.pid"

set :shared_paths, ['config/database.yml', 'log', 'tmp', 'public']


task :setup => :environment do
  queue! %[mkdir -p "#{deploy_to}/shared/log"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/log"]

  queue! %[mkdir -p "#{deploy_to}/shared/config"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/config"]
  
  queue! %[mkdir -p "#{deploy_to}/shared/pids"]
  queue! %[mkdir -p "#{deploy_to}/shared/sockets"]
  queue! %[mkdir -p "#{deploy_to}/shared/tmp"]
  queue! %[mkdir -p "#{deploy_to}/shared/public"]

  queue! %[touch "#{deploy_to}/shared/config/database.yml"]
end

task :down do
  invoke :restart
  invoke :mina 
end

namespace :db do 
  task :migrate do 
    queue 'cd #{deploy_to} && rake db:migrate'
  end
end

task :deploy => :environment do
  deploy do
    
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    #invoke :'rails:assets_precompile'
    invoke :'deploy:cleanup' 
    invoke :'log:unicorn:clean'
    invoke :'log:app:clean'

    to :launch do
      invoke :'unicorn:restart'
    end
  end
end

namespace :nginx do 
  task :restart do
    queue 'sudo service nginx restart'
  end
end

namespace :log do
  task :nginx do 
  end

  namespace :unicorn do 
    task :error do 
      queue "cat < #{deploy_to}/shared/log/unicorn.stderr.log"
    end

    task :out do 
      queue "cat < #{deploy_to}/shared/log/unicorn.stdout.log"
    end

    task :clean do 
      queue "rm  #{deploy_to}/shared/log/unicorn.stdout.log"
      queue "rm  #{deploy_to}/shared/log/unicorn.stderr.log"
    end
  end

  namespace :app do 
    task :error do 
      queue "cat < #{deploy_to}/shared/log/production.log"
    end

    task :clean do 
      queue "rm  #{deploy_to}/shared/log/production.log"
    end
  end
end


