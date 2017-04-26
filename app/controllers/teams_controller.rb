class TeamsController < ApplicationController

  get '/teams' do
    if !logged_in?
      @teams = Team.all
      erb :'teams/index'
    else
      redirect to "/login"
    end
  end

  get '/teams/new' do 
    if logged_in?
      erb :'teams/new'
    else
      redirect to "/login"
    end
  end
  
end