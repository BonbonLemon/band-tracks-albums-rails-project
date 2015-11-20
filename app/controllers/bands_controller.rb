class BandsController < ApplicationController
  def index
    @bands = Band.all
  end

  def show
  end

  def new
    @band = Band.new
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      redirect_to bands_url
    else
      render :new
    end
  end

  def edit
    @band = Band.find_by(id: params[:id])
  end

  def update
    @band = Band.find_by(id: params[:id])
    if @band.update_attributes(band_params)
      redirect_to band_url(@band)
    else
      render :edit
    end
  end

  private
  def band_params
    params.require(:band).permit(:name)
  end
end
