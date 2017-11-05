class TeamPlayersController < ApplicationController

  # GET: /team_players
  get "/team_players" do
    erb :"/team_players/index.html"
  end

  # GET: /team_players/new
  get "/team_players/new" do
    erb :"/team_players/new.html"
  end

  # POST: /team_players
  post "/team_players" do
    redirect "/team_players"
  end

  # GET: /team_players/5
  get "/team_players/:id" do
    erb :"/team_players/show.html"
  end

  # GET: /team_players/5/edit
  get "/team_players/:id/edit" do
    erb :"/team_players/edit.html"
  end

  # PATCH: /team_players/5
  patch "/team_players/:id" do
    redirect "/team_players/:id"
  end

  # DELETE: /team_players/5/delete
  delete "/team_players/:id/delete" do
    redirect "/team_players"
  end
end
