class FitnessClassesController < ApplicationController

  get '/fitness_classes' do
    if logged_in?
      @fitness_classes = FitnessClass.all
      erb :'fitness_classes/classes'
    else
      redirect to '/login'
    end
  end

  get '/fitness_classes/new' do
    if logged_in?
      erb :'fitness_classes/new_class'
    else
      redirect to '/login'
    end
  end
end
