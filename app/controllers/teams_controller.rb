class TeamsController < ApplicationController

  get '/teams' do
    redirect_if_not_logged_in
    @teams = Team.all
    erb :'teams/index'
  end

  get '/teams/new' do 
    redirect_if_not_logged_in
    erb :'teams/new'
  end

end