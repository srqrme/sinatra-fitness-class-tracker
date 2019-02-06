class UsersController < ApplicationController

  get '/signup' do
    if logged_in?
      redirect to '/fitness_classes'
    else
      erb :'users/signup'
    end
  end

end
