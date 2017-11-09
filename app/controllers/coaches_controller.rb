class CoachesController < ApplicationController

  # GET: /coaches
  get "/coaches" do
    erb :"/coaches/index.html"
  end

  get '/coaches/login' do
    if !logged_in?
      erb :"/coaches/login"
    else
      @coach = current_user
      redirect to "/coaches/#{@coach.id}"
    end
  end

  # GET: /coaches/new
  get "/coaches/new" do
    if !logged_in?
      @teams = Team.all.collect do |team|
         if team.coach == nil
           team
         end
      end
      @teams.compact!
      # binding.pry
      erb :"/coaches/new.html"
    else
      redirect to "/coaches"
    end
  end

  post "/coaches/new" do
    if !params["coach"]["name"].empty? && !params["coach"]["username"].empty? && !params["coach"]["password"].empty?
      if Coach.find_by(username: params["coach"]["username"])
        redirect to '/coaches/login'
      else
        binding.pry
        @coach = Coach.create(params["coach"])
        if Team.find_by(params["team"])
          @coach.team = Team.find_by(params["team"])
        else
          @coach.team = Team.create(params["team"])
        end
        session[:user_id] = @coach.id
        redirect to "/coaches/#{@coach.id}"
      end
    else
      redirect to '/coaches/new'
    end
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
