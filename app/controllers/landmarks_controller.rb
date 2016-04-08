class LandmarksController < ApplicationController

  get '/landmarks' do 
    @landmarks = Landmark.all
    erb :'landmarks/index'
  end

  post '/landmarks' do 
    @landmark = Landmark.create(params[:landmark])
    @landmark.save
    puts @landmark.id

    erb :'landmarks/show'
  end

  get '/landmarks/new' do 
    erb :'landmarks/new'
  end

  get '/landmarks/:landmark_id' do 
    @landmark = Landmark.find(params[:landmark_id])
    erb :'landmarks/show'
  end

  patch '/landmarks/:landmark_id' do
    @landmark = Landmark.find(params[:landmark_id])
    @landmark.update(params[:landmark])
    @landmark.save

    redirect "/landmarks/#{@landmark.id}"
  end

  get '/landmarks/:landmark_id/edit' do 
    @landmark = Landmark.find(params[:landmark_id])
    erb :'landmarks/edit'
  end

end
