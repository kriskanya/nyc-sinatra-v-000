class FiguresController < ApplicationController

  get '/figures/new' do 
    erb :'figures/new'
  end

  get '/figures' do 
    @figures = Figure.all
    erb :'figures/index'
  end

  post '/figures' do 
    @figure = Figure.create(params[:figure])

    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end

    if !params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end
  
    @figure.save

    erb :'figures/show'
  end

  get '/figures/:figure_id' do
    @figure = Figure.find(params[:figure_id])
    erb :'figures/show'
  end

  patch '/figures/:figure_id' do 
    @figure = Figure.find(params[:figure_id])
    @figure.update(params[:figure])

    @figure.landmarks << Landmark.find_or_create_by(name: params[:landmark][:name])
    @figure.titles << Title.find_or_create_by(name: params[:title][:name])
    @figure.save

    redirect "/figures/#{@figure.id}"
  end

  get '/figures/:figure_id/edit' do 
    @figure = Figure.find(params[:figure_id])
    erb :'figures/edit'
  end

end
