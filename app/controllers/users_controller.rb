class UsersController < ApplicationController

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'users/show'
  end

  get '/signup' do
    if !logged_in?
      erb :'users/signup'
    else
      redirect to '/fitness_classes/'
    end
  end

  post '/signup' do
    if params[:name] == "" || params[:username] == "" || params[:password] == ""
      redirect to "/signup"
    else
      @user = User.create(:name => params[:name], :username => params[:username], :password => params[:password])
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

  post '/login' do
    @user = User.find_by(:username => params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to '/fitness_classes'
    else
      redirect to '/login'
    end
  end

  get '/logout' do
    if logged_in?
      session.destroy
      redirect to '/login'
    else
      redirect to '/'
    end
  end
end
