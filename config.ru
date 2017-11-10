require './config/environment'
set :database, ENV['DATABASE_URL'] || "postgres://localhost:5432/PostgresSQL 10"
if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride
use CoachesController
use TeamsController
use PlayersController
run ApplicationController
