class UsersController < ApplicationController

  get '/signup' do
    if logged_in?
      redirect to "/tweets"
    else
      erb :'users/new'    
    end
  end

  post '/signup' do
    if params[:username].empty? || params[:password].empty?
      redirect to "/signup"
    else
      @user = User.create(params)
      @user.save
      session[:id] = @user.id
      redirect to "/teams"
    end 
  end

  get '/login' do 
    if !logged_in?
      erb :'users/login'
    else
      redirect to "/teams"
    end
  end

  post '/login' do 
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:id] = @user.id
      redirect to "/teams"
    else
      redirect to "/signup"
    end
  end

end