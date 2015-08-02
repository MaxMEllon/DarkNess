class AlbumsController < ApplicationController
  protect_from_forgery expect: [:create]
  def new
    @album = Album.new
  end

  def create
    upload_file = params[:files]
    album = {}
    album[:zip] = upload_file unless upload_file.nil?
    @album = Album.new(album)
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
