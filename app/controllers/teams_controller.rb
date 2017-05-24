class TeamsController < ApplicationController

  get '/teams' do
    redirect_if_not_logged_in
    @teams = current_user.teams
    erb :'teams/index'
  end

  get '/teams/new' do 
    redirect_if_not_logged_in
    erb :'teams/new'
  end

  post '/teams/new' do
    @team = current_user.teams.build(params)
    if @team.save
      redirect to "/teams"
    else
      redirect to "/teams/new"
    end
  end

  get '/teams/:id' do 
    redirect_if_not_logged_in
    @team = Team.find_by_id(params[:id])
    erb :'teams/show'
  end

  get '/teams/:id/edit' do
    redirect_if_not_logged_in
    @team = current_user.teams.find(params[:id])
    erb :'teams/edit'
  end

  put '/teams/:id' do
    redirect_if_not_logged_in
    @team = Team.find_by_id(params[:id])
    if @team && @team.user == current_user
      if @team.update(name: params[:name], roster_size: params[:roster_size])
        redirect to "/teams/#{@team.id}"
      else
        redirect to "/teams/#{params[:id]}/edit"
      end
    else
      redirect to "/teams"
    end
  end
end