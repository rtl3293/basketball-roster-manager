class CoachesController < ApplicationController

  # GET: /coaches
  get "/coaches" do
    erb :"/coaches/index.html"
  end

  get '/coaches/login' do
    erb :"/coaches/login"
  end

  # GET: /coaches/new
  get "/coaches/new" do
    @teams = Team.all.collect do |team|
       if team.coach == nil
         team
       end
    end
    @teams.compact!
    # binding.pry
    erb :"/coaches/new.html"
  end

  # POST: /coaches
  post "/coaches" do
    @coach = Coach.find_by(username: params["username"])
    # binding.pry
    if @coach && @coach.authenticate(params["password"])
      session[:user_id] = @coach.id
      # binding.pry
      redirect to "/coaches/#{@coach.id}"
    else
      redirect to "/failure"
    end
  end

  # GET: /coaches/5
  get "/coaches/:id" do
    @coach = current_user
    # binding.pry
    if logged_in? && @coach.id == params["id"].to_i
      # binding.pry
      @team = @coach.team
      @players = @team.players
      erb :"/coaches/show.html"
    else
      redirect to '/failure'
    end
  end

  # GET: /coaches/5/edit
  get "/coaches/:id/edit" do
    erb :"/coaches/edit.html"
  end

  # PATCH: /coaches/5
  patch "/coaches/:id" do
    redirect "/coaches/:id"
  end

  # DELETE: /coaches/5/delete
  delete "/coaches/:id/delete" do
    redirect "/coaches"
  end
end
