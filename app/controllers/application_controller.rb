require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret, "basketball"
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :index
  end

  get "/failure" do
    erb :failure
  end

  helpers do
    def current_user
      Coach.find(session[:user_id])
    end

    def logged_in?
      !!session[:user_id]
    end
  end
end
