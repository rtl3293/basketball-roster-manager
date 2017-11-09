class PlayersController < ApplicationController

  # GET: /players
  get "/players" do
    if logged_in?
      @players = Player.all.sort do |a, b|
        a.points <=> b.points
      end
      erb :"/players/index.html"
    else
      redirect to '/coaches/login'
    end
  end

  # GET: /players/5
  get "/players/:id" do
    erb :"/players/show.html"
  end

  # GET: /players/5/edit
  get "/players/:id/edit" do
    erb :"/players/edit.html"
  end

  # PATCH: /players/5
  patch "/players/:id" do
    redirect "/players/:id"
  end

  # DELETE: /players/5/delete
  delete "/players/:id/delete" do
    redirect "/players"
  end
end
