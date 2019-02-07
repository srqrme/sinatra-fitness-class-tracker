class UsersController < ApplicationController

  get '/signup' do
    if logged_in?
      redirect to '/fitness_classes'
    else
      erb :'users/signup'
    end
  end

  post '/signup' do
    if params[:name] == "" || params[:username] == "" || params[:password]
      redirect to '/signup'
    else
      @user = User.new(:name => params[:name], :username => params[:username], :password => params[:password])
      @user.save
      session[:user_id] = @user.id
      redirect to '/fitness_classes'
    end
  end

  get '/login' do
    if logged_in?
      redirect to '/fitness_classes'
    else
      erb :'users/login'
    end
  end

end
