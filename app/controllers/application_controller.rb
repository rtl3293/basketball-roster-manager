require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret, "basketball"
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    redirect to "/coaches/#{current_user.id}" if logged_in? 
    erb :index
  end

  get "/failure" do
    erb :failure
  end

  get "/logout" do
    session.clear
    redirect to '/'
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
