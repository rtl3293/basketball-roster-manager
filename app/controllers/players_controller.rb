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
    if logged_in?
      @player = Player.find(params[:id])
      @coach = @player.coach
      @team = @player.team
      erb :"/players/show.html"
    else
      redirect to '/coaches/login'
    end
  end

  # GET: /players/5/edit
  get "/players/:id/edit" do
    @player = Player.find(params[:id])
    if logged_in? && @player.coach == current_user
      erb :"/players/edit.html"
    else
      redirect to "/players/#{@player.id}"
    end
  end

  # PATCH: /players/5
  patch "/players/:id/edit" do
    binding.pry
    redirect "/players/:id"
  end

  # DELETE: /players/5/delete
  delete "/players/:id/delete" do
    redirect "/players"
  end
end
