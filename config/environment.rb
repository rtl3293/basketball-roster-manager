ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

db = URI.parse(ENV['HEROKU_POSTGRESQL_COBALT_URL'] || 'postgres://rmzzjkvapswrbm:4239e58f499f5291e3b29c07c9ce7f8af292860236238c917db6d8f8c7519e5e@ec2-107-22-162-82.compute-1.amazonaws.com:5432/dbqh4sgm9p542o')

ActiveRecord::Base.establish_connection(
  :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
  :host     => db.host,
  :username => db.user,
  :password => db.password,
  :database => db.path[1..-1],
  :encoding => 'utf8'
)

require_all 'app'
