class AlbumsController < ApplicationController
  def show
    @ablum = Album.find_by(params[:id])
  end

  def create
    @album = Album.new(album_params)
    @album.band_id = params[:id]
    if @album.save
      redirect_to albums_url
    else
      render :new
    end
  end

  def new
    @album = Album.new
  end

  private
  def album_params
    params.require(:album).permit(:name)
  end
end
