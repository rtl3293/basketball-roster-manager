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
    # binding.pry
    @coach = current_user
    if logged_in?
      # binding.pry
      @team = @coach.team
      erb :"/coaches/show.html"
    else
      redirect to '/coaches/login'
    end
  end

  # GET: /coaches/5/edit
  get "/coaches/:id/edit" do
    if logged_in?
      @coach = Coach.find(params[:id])
      @teams = Team.all
      if @coach == current_user
        erb :"/coaches/edit.html"
      else
        redirect to '/coaches'
      end
    else
      redirect to '/coaches/login'
    end
  end

  # PATCH: /coaches/5
  patch "/coaches/:id" do
    binding.pry
    @coach = Coach.find(params[:id])
    if !params["team"]["team_name"].empty?
      if Team.find_by(params["team"])
        @coach = Team.find_by(params["team"])
      else
        @coach = Team.create(params["team"])
      end
      redirect "/coaches/#{@coach.id}"
    else
      redirect to "/coaches/#{@coach.id}/edit"
    end
  end

  # DELETE: /coaches/5/delete
  delete "/coaches/:id/delete" do
    @coach = Coach.find(params[:id])
    if @coach == current_user
      @coach.delete
      session.clear
      redirect to "/"
    else
      redirect to "/coaches/#{@coach.id}"
    end
  end
end
