class TeamsController < ApplicationController

  # associate a team to user upon creation
  # filter teams by current_user 
  # don't let another user edit another users team

  # active record associative methods
  # http://guides.rubyonrails.org/association_basics.html

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
      # build
    @team = Team.create(params)
    redirect to "/teams"
    end
  end

  get '/teams/:id' do 
    redirect_if_not_logged_in
    @team = Team.find_by_id(params[:id])
    erb :'teams/show'
  end

  get '/teams/:id/edit' do
    redirect_if_not_logged_in
    @team = Team.find(params[:id])
    erb :'teams/edit'
  end

  put '/teams/:id' do 
    @team = Team.find_by_id(params[:id])
    @team.name = params[:name]
    @team.roster_size = params[:roster_size]
    if @team.save
      redirect to "/teams/#{params[:id]}/edit"
    else
      redirect to "/teams/#{@team.id}"
    end
  end
end