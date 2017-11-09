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
      erb :"/teams/show.html"
    else
      redirect to '/coaches/login'
    end
  end

  # GET: /teams/5/edit
  get "/teams/:id/edit" do
    erb :"/teams/edit.html"
  end

  # PATCH: /teams/5
  patch "/teams/:id" do
    redirect "/teams/:id"
  end

  # DELETE: /teams/5/delete
  delete "/teams/:id/delete" do
    redirect "/teams"
  end
end
