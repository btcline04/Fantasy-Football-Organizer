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

  post '/teams/new' do
    if params[:name].empty? || params[:roster_size].empty?
      redirect to "/teams/new"
    else
    @team = Team.create(params)
    redirect to "/teams"
    end
  end

  get '/teams/:id/edit' do
    redirect_if_not_logged_in
    @team - Team.find(params[:id])
    erb :'teams/edit'
  end

end