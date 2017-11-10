ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

ActiveRecord::Base.establish_connection({
    :adapter => 'postgresql',
     :database => 'basketball_postgresql',
     :host => 'localhost',
     :port => '5432',
     :username => 'Ryan',
     :password => ''}
)

require_all 'app'
