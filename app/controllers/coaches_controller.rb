class CoachesController < ApplicationController

  # GET: /coaches
  get "/coaches" do
    erb :"/coaches/index.html"
  end

  # GET: /coaches/new
  get "/coaches/new" do
    erb :"/coaches/new.html"
  end

  # POST: /coaches
  post "/coaches" do
    redirect "/coaches"
  end

  # GET: /coaches/5
  get "/coaches/:id" do
    erb :"/coaches/show.html"
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
