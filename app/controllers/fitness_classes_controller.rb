class FitnessClassesController < ApplicationController

  get '/fitness_classes' do
    if logged_in?
      @fitness_classes = FitnessClass.all
      binding.pry
      erb :'fitness_classes/classes'
    else
      redirect to '/login'
    end
  end

end
