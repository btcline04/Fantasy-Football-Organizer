class PlayersController < ApplicationController

# ask Luke how to get current_user.players to function properly, i.e. associate players with a user along w/ a team
  get '/players' do 
    redirect_if_not_logged_in
    @players = Player.all 
    erb :'players/index'
  end

  get '/players/new' do 
    redirect_if_not_logged_in
    @teams = current_user.teams
    erb :'players/new'
  end

  post '/players/new' do
    @player = Player.new(name: params[:name], number: params[:number], position: params[:position], team_id: params[:id])
    if @player.save
      redirect to "/players"
    else
      redirect to "/players/new"
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

  put '/players/:id' do
    @player = Player.find_by_id(params[:id])
    @player.name = params[:name]
    @player.number = params[:number]
    @player.position = params[:position]
    @player.team_id = params[:team_id]
    if @player.save
      redirect to "/players/#{@player.id}"
    else
      redirect to "/players/#{params[:id]}/edit"
    end
  end

  delete '/players/:id/delete' do 
    redirect_if_not_logged_in
    @player = Player.find_by_id(params[:id])
    if @player.destroy
      redirect to "/players"
    else
      redirect to "/players/#{params[:id]}/edit"
    end
  end


end



