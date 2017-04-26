class UsersController < ApplicationController

  get '/signup' do
    if !session[:user_id]
      erb :'users/new'
    else
      redirect "/"
    end
  end

  post '/signup' do
    if params[:username].empty? || params[:password].empty?
      redirect to "/signup"
    else
      binding.pry
      @user = User.create(params)
      @user.save
      session[:id] = @user.id
    end 
  end
end