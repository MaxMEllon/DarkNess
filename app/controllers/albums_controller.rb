class AlbumsController < ApplicationController
  def new
    @album = Album.new
  end

  def create
    @album = @album.create_event(album_params)
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
