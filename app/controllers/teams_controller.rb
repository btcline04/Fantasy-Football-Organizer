class TeamsController < ApplicationController

  get '/teams' do
    if logged_in?
      @teams = Teams.all
      erb :'teams/index'
    else
      redirect "/login"
    end
  end

  
end