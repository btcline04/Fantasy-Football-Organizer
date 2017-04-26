class UsersController < ApplicationController

  get '/signup' do
    if !session[:user_id]
      erb :'users/new'
    else
      redirect to "/teams"
    end
  end

  post '/signup' do
    if params[:username].empty? || params[:password].empty?
      redirect to "/signup"
    else
      @user = User.create(params)
      @user.save
      session[:user_id] = @user.id
      redirect to "/teams"
    end 
  end

  get '/login' do 
    if !session[:user_id]
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
