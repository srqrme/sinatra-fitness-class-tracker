class UsersController < ApplicationController
  validates :name, format: { with: /\A[a-zA-Z]+\z/,
    message: "Please use letters only"}

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
      @user = User.create(:name => params[:name], :username => params[:username], :password => params[:password])
      session[:user_id] = @user.id
      redirect '/fitness_classes'
    end
  end
end
