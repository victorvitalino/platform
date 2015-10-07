source 'https://rubygems.org'

gem 'rails', '4.2.1'

gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'jquery-ui-rails'

gem 'simple_form'
gem 'haml-rails'

gem 'i18n'
gem 'railties'
gem 'enum_help'

gem 'devise'
gem 'devise_security_extension'

gem 'pundit', :git => 'https://github.com/codhab/pundit.git', :branch => 'master'
gem 'redactor-rails'
gem 'mini_magick'

gem 'friendly_id'
gem 'remotipart', '~> 1.2'

gem 'validates_cpf_cnpj'
gem 'validates_timeliness'
gem 'email_validator'
gem 'bootstrap-datepicker-rails'

gem 'wkhtmltopdf-binary'
gem 'wicked_pdf'

gem 'jquery-datatables-rails', '~> 3.3.0'
gem 'codhab_billing', git: 'https://github.com/codhab/codhab_billing.git'

gem 'axlsx', '~> 2.0.1'

group :test do
  gem 'sqlite3'
  gem 'rspec-rails'
  gem 'capybara'
  gem 'factory_girl_rails'
  gem 'poltergeist'
end

group :development do
  gem 'carrierwave'
  gem 'derailed'
  gem 'byebug'
  gem 'thin'
  gem 'capistrano', '~> 3.1.0'
  gem 'capistrano-puma', require: false
  gem 'capistrano-rails',   '~> 1.1', require: false
  gem 'capistrano-bundler', '~> 1.1', require: false
  gem 'capistrano-rvm',   '~> 0.1', require: false
end

group :production do
  gem 'pg'
  gem 'unicorn'
  gem 'carrierwave-ftp', :require => 'carrierwave/storage/sftp'
end


gem 'portal',                       path: 'engines/portal'

gem 'dashboard',                    path: 'engines/dashboard'
gem 'person',                       path: 'engines/person'
gem 'cms',                          path: 'engines/cms'
gem 'helpdesk',                     path: 'engines/helpdesk'
gem 'protocol',                     path: 'engines/protocol'

gem 'concourse',                    path: 'engines/concourse'
gem 'concourse_portal',             path: 'engines/concourse_portal'

gem 'attendance',                   path: 'engines/attendance'
gem 'finance',                      path: 'engines/finance'


gem 'candidate',                    path: 'engines/candidate'
gem 'address',                      path: 'engines/address'

gem 'regularization',               path: 'engines/regularization'
gem 'regularization_portal',        path: 'engines/regularization_portal'
