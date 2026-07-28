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
      url: params[:song][:url]
    )

    if params[:song][:image].present?
      @song.image = params[:song][:image].read
      @song.image_type = params[:song][:image].content_type
    end

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

    song.title = params[:song][:title]
    song.vocal = params[:song][:vocal]
    song.songwriting = params[:song][:songwriting]
    song.url = params[:song][:url]

    if params[:song][:image].present?
      song.image = params[:song][:image].read
      song.image_type = params[:song][:image].content_type
    end

    if song.save
      redirect_to '/'
    else
      render 'edit', status: :unprocessable_content
    end
  end
  
  def image
    song = Song.find(params[:id])

    send_data song.image,
              type: song.image_type,
              disposition: "inline"
  end
end