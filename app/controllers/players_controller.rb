class PlayersController < ApplicationController

  get '/players' do 
    redirect_if_not_logged_in
    @players = Player.all 
    erb :'players/index'
  end
  
end