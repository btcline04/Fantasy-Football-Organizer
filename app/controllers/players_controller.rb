class PlayersController < ApplicationController

  get '/players' do 
    redirect_if_not_logged_in
    @players = Player.all 
    erb :'players/index'
  end

  get '/players/new' do 
    redirect_if_not_logged_in
    erb :'players/new'
  end

  post '/players/new' do
    if params[:name].empty? || params[:number].empty? || params[:position].empty?
      redirect to "/players/new"
    else
      @player = Player.create(params)
      redirect to "/players"
    end
  end
  
end