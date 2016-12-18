class SongsController < ApplicationController
  def new
    @song=Song.new
  end

  def create
    @song=Song.create(post_params(:title, :release_year, :released, :genre, :artist_name))
    if @song.valid?
      redirect_to @song
    else
      render :new
    end
  end

  def edit
    @song=Song.find(params[:id])
  end

  def update
    @song=Song.find(params[:id])
    if @song.update(post_params(:title, :release_year, :released, :genre, :artist_name))
      redirect_to @song
    else
      render :edit
    end
  end

  def destroy
    @song=Song.find(params[:id])
    @song.destroy
    redirect_to songs_url
  end

  def index
    @songs=Song.all
  end

  def show
    @song=Song.find(params[:id])
  end
  def post_params(*args)
    params.require(:song).permit(*args)
  end
end
