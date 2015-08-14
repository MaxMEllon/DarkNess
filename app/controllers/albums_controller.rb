class AlbumsController < ApplicationController
  protect_from_forgery expect: [:create]
  before_action :set_file, only: [:create]
  before_action :set_album, only: [:show]

  def new
    @album = Album.new
  end

  def create
    File.binwrite(@path, @file.tempfile.read)
  rescue
    redirect_to new_album_path, alert: 'File Uploadに失敗'
  else
    @album = Album.create(zip_path: @path, title: @title)
    @album.unzip_and_bind_photos
    redirect_to root_path
  end

  def show
    @photos = @album.photos
  end

  def list
    @albums = Album.all
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_album
    return unless params[:id]
    @album = Album.find(params[:id])
  end

  def set_file
    return unless params[:files]
    @file = params[:files][0]
    @path = Rails.root.join('public', 'zip', @file.original_filename)
    @title = @file.original_filename.gsub(".zip", "")
  end
end
