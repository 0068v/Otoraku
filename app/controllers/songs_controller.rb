class SongsController < ApplicationController
  def index
    @songs = Song.all
  end
  
  def new
    @song = Song.new
  end
  
  def create
    @song = Song.new(
      title: params[:song][:title], 
      vocal: params[:song][:vocal], 
      songwriting: params[:song][:songwriting],
      url: params[:song][:url],
      image: params[:song][:image]
    )
    if @song.save
        redirect_to '/'
    else
        render 'new', status: :unprocessable_content
    end
  end
  
  def destroy
    song = Song.find(params[:id])
    song.destroy
    redirect_to '/'
  end
  
  def show
    @song = Song.find(params[:id])
  end
  
  def edit
    @song = Song.find(params[:id])
  end
  
  def update
    song = Song.find(params[:id])
    song.update(
      title: params[:song][:title], 
      vocal: params[:song][:vocal], 
      songwriting: params[:song][:songwriting],
      url: params[:song][:url],
      image: params[:song][:image]
    )
    redirect_to '/'
  end
end
