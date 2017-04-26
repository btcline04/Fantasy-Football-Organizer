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
end