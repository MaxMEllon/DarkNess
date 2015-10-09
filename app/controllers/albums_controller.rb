class AlbumsController < ApplicationController
  protect_from_forgery expect: [:create]
  before_action :set_file, only: [:create]
  before_action :set_album, only: [:show, :update, :destroy]

  def new
    @album = Album.new
  end

  def create
    File.binwrite(@path, @file.tempfile.read)
    @album = Album.create(zip_path: @path, title: @title)
    @album.unzip_and_build_photos
  rescue
    @album.destroy unless @album.nil?
    redirect_to new_album_path, alert: 'File Uploadに失敗'
  else
    if Album.last.nil?
      redirect_to new_album_path, alert: 'zipの解凍に失敗'
    else
      redirect_to root_path
    end
  end

  def show
    @photos = @album.photos.page(params[:page]).per(1)
  end

  def list
    @albums = Album.all.sort.reverse
  end

  def edit
  end

  def update
  end

  def destroy
    @album.destroy
    @albums = Album.all
    render :list
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
    @title = @file.original_filename.gsub('.zip', '')
  end
end
