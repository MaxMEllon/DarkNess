class AlbumsController < ApplicationController
  protect_from_forgery expect: [:create]
  def new
    @album = Album.new
  end

  def create
    @album = Album.new
    @album.zip =  params[:files].to_s
    @album.save!
    redirect_to root_path
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def album_params
    params[:album].permit(:zip)
  end
end
