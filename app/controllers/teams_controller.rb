class TeamsController < ApplicationController

  # GET: /teams
  get "/teams" do
    if logged_in?
      @teams = Team.all.sort do |a,b|
        a.wins <=> b.wins
      end
      erb :"/teams/index.html"
    else
      redirect to '/coaches/login'
    end
  end

  # GET: /teams/5
  get "/teams/:id" do
    if logged_in?
      @team = Team.find(params[:id])
      @players = @team.players
      #
      erb :"/teams/show.html"
    else
      redirect to '/coaches/login'
    end
  end

  # GET: /teams/5/edit
  get "/teams/:id/edit" do
    @team = Team.find(params[:id])
    redirect to "/coaches/login" if !logged_in?
    #
    if @team.coach == current_user
      @players = Player.all
      erb :"/teams/edit.html"
    else
      redirect to "/teams/#{@team.id}"
    end
  end

  # PATCH: /teams/5
  patch "/teams/:id/edit" do
    @team = Team.find(params[:id])
    params["player"]["name"].delete_if {|x| x.empty?}
    if params["player"]["name"].length <= 5
      #
      @team.update_roster(params["player"]["name"])
      @team.wins = params["team"]["wins"] if !params["team"]["wins"].empty?
      @team.losses = params["team"]["losses"] if !params["team"]["losses"].empty?
      @team.save
      redirect to "/teams/#{@team.id}"
    else
      redirect to "/teams/#{@team.id}/edit"
    end
  end

  # DELETE: /teams/5/delete
  delete "/teams/:id/delete" do
    redirect "/teams"
  end
end
