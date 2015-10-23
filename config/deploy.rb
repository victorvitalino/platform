require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
require 'mina/rvm'
require 'mina/unicorn'


set  :domain,  ENV['HOST_PRODUCTION_SERVER']
set  :user,  'sedhab'
set  :deploy_to, '/var/www/platform'
set  :repository, 'https://github.com/codhab/platform.git' 
set  :branch, 'stable'

set :rails_env, 'production'

set :unicorn_pid, "#{deploy_to}/shared/pids/unicorn.pid"

set :shared_paths, ['config/database.yml', 'log']


task :setup => :environment do
  queue! %[mkdir -p "#{deploy_to}/shared/log"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/log"]

  queue! %[mkdir -p "#{deploy_to}/shared/config"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/config"]

  queue! %[touch "#{deploy_to}/shared/config/database.yml"]
end

task :down do
  invoke :restart
  invoke :mina 
end

task :deploy => :environment do
  deploy do
    
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'rails:assets_precompile'
    invoke :'deploy:cleanup'

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
    queue 'cat < /var/log/nginx/error.log'
  end
end

