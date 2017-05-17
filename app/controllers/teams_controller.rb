class TeamsController < ApplicationController

  # associate a team to user upon creation
  # filter teams by current_user 
  # don't let another user edit another users team

  # active record associative methods
  # http://guides.rubyonrails.org/association_basics.html

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
    @team = Team.find_by_id(params[:id])
    @team.name = params[:name]
    @team.roster_size = params[:roster_size]
    if @team.save
      redirect to "/teams/#{@team.id}"
    else
      redirect to "/teams/#{params[:id]}/edit"
    end
  end
end