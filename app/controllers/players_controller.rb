class PlayersController < ApplicationController

  get '/players' do 
    redirect_if_not_logged_in
    @players = Player.all 
    erb :'players/index'
  end

  get '/players/new' do 
    redirect_if_not_logged_in
    @teams = Team.all
    erb :'players/new'
  end

  post '/players/new' do
    if params[:name].empty? || params[:number].empty? || params[:position].empty?
      redirect to "/players/new"
    else
      @player = Player.create(name: params[:name], number: params[:number], position: params[:position], team_id: params[:id])
      redirect to "/players"
    end
  end

  get '/players/:id' do 
    redirect_if_not_logged_in
    @player = Player.find_by_id(params[:id])
    erb :'players/show'
  end

  get '/players/:id/edit' do 
    redirect_if_not_logged_in
    @player = Player.find_by_id(params[:id])
    erb :'players/edit'
  end

  post '/players/:id' do
    if params[:name].empty? || params[:number].empty? || params[:position].empty?
      redirect to "/players/#{params[:id]}/edit"
    else
      @player = Player.find_by_id(params[:id])
      @player.name = params[:name]
      @player.number = params[:number]
      @player.position = params[:position]
      @player.save
      redirect to "/players/#{@player.id}"
    end
  end

end



