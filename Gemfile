source 'http://rubygems.org'

ruby '2.1.2'

gem 'rails', '3.2.21'

# To use debugger
#gem 'ruby-debug'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'coffee-rails', "~> 3.2.2"
  gem 'uglifier'
  gem 'asset_sync'
end

gem 'sass-rails'
gem 'compass-rails'

gem 'jquery-rails', '2.1.4'

# Bundle the extra gems:

# gem 'heroku' install the Heroku toolbelt (https://toolbelt.heroku.com/) instead (as gem had some problems)
#gem 'thin'
gem 'unicorn', "~>4.6.3"
gem "rack-timeout"

gem "mysql2"
gem 'haml'
gem 'sass', "  ~> 3.2.9"
gem 'rest-client', '>= 1.6.0'
gem 'paperclip'
gem 'delayed_paperclip'
gem 'aws-sdk'
gem "will_paginate"
gem 'dalli'
gem "memcachier"
gem 'kgio', "~>2.8.0"
gem 'thinking-sphinx', '~> 3.1.4'
gem 'flying-sphinx', "~>1.2.0"
# Use patched v2.0.2
# Fixes issues: Create a new delayed delta job if there is an existing delta job which has failed
gem 'ts-delayed-delta', "~>2.0.2",
  :git    => 'git://github.com/pat/ts-delayed-delta.git',
  :branch => 'master',
  :ref    => '839284f2f28b3f4caf3a3bf5ccde9a6d222c7f4d'
gem 'possibly', '~> 0.2.0'
gem 'recaptcha'
gem 'delayed_job', "~>3.0.5"
gem 'delayed_job_active_record'
gem 'json', "~>1.8.0"
gem 'multi_json', "~>1.7.3" # 1.8.0 caused "invalid byte sequence in UTF-8" at heroku
gem 'russian'
gem 'web_translate_it'
gem 'postmark-rails' # could be removed as not currently used
gem 'rails-i18n'
gem 'devise', "~>2.2.4"  #3.0rc requires bit bigger changes
gem "devise-encryptable"
gem "omniauth-facebook", '~> 2.0.1'
gem 'spreadsheet'
gem 'rabl'
gem 'rake'
gem 'xpath'
gem 'dynamic_form'
gem "truncate_html"
gem 'money-rails'
gem 'mercury-rails'
gem 'fb-channel-file'
gem 'country_select', '> 1.2.0'
gem 'braintree'
gem "mail_view", "~> 1.0.3"
gem 'statesman', '~> 0.5.0'
gem "premailer"
gem 'stringex', '~> 2.5.2'
gem 'validates_timeliness', '~> 3.0'
gem 'paypal-sdk-permissions',
  :git    => 'git://github.com/paypal/permissions-sdk-ruby.git',
  :branch => 'master',
  :ref    => 'c0240bee9f94fe6338d67b4f754e1a11ce81619a'
gem 'paypal-sdk-merchant', '~> 1.116.0'
gem 'airbrake', '~>4.1.0'
gem 'youtube_addy', '~> 1.0.4'
gem 'cocoon', '~> 1.2.6'
gem 'twilio-ruby', '~> 4.2.0'
gem 'faraday'
gem 'mixpanel-ruby'
gem 'paper_trail'

group :staging, :production do
  gem 'newrelic_rpm', '~> 3.9.1.236'
end

group :development, :test do
  gem 'rubocop',          require: false
  gem 'factory_girl_rails'
end

group :development do
  gem 'guard-livereload', require: false
  gem 'rack-livereload'
  gem 'rb-fsevent',       require: false
  gem 'annotate'
  gem 'zeus', '0.15.1'
  gem 'i18n-tasks', '~> 0.6.2'
  gem "letter_opener"
end

group :test do
  gem "rspec-rails", "~>3.4"
  gem 'capybara'
  gem 'cucumber-rails', :require => false
  gem 'cucumber'
  gem 'selenium-webdriver', "~>2.43.0"
  gem 'launchy'
  gem 'ruby-prof'
  gem "pickle"
  gem 'email_spec'
  gem 'action_mailer_cache_delivery'
  gem "parallel_tests", :group => :development
  gem 'timecop'
  gem 'rack-test'
  gem 'database_cleaner'
  gem 'connection_pool'
  gem 'coveralls', require: false
  gem 'webmock'
end

group :development, :test do
  gem 'pry'
  gem 'pry-rails'
  gem 'pry-nav'
  gem 'pry-stack_explorer'
  gem "better_errors"
  gem "binding_of_caller"
end

gem 'strong_parameters'
