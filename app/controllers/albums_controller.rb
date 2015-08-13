class AlbumsController < ApplicationController
  protect_from_forgery expect: [:create]
  before_action :set_file, only: [:create]

  def new
    @album = Album.new
  end

  def create
    File.binwrite(@path, @file.tempfile.read)
  rescue
    redirect_to new_album_path, alert: 'File Uploadに失敗'
  else
    @album = Album.create(zip_path: @path)
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

  def set_file
    return unless params[:files]
    @file = params[:files][0]
    @path = Rails.root.join('public', 'zip', @file.original_filename)
  end
end
