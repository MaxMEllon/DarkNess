class AlbumsController < ApplicationController
  protect_from_forgery expect: [:create]
  def new
    @album = Album.new
  end

  def create
    file = params[:files]
    binary   = file[0].tempfile.read
    filename = file[0].original_filename
    File.binwrite('public/zip/#{filename}', binary)
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
