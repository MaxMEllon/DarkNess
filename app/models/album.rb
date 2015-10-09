# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  event_id   :integer
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  zip_path   :string
#  page_num   :integer
#

class Album < ActiveRecord::Base
  has_many :photos
  belongs_to :event
  before_destroy :remove_photos

  def unzip_and_build_photos
    mkdir
    unzip
    build_photos
    update_page_num
  end

  private

  def directory_path
    Rails.root.join('public', 'images', id.to_s)
  end

  def remove_photos
    `rm -rf #{directory_path}`
  end

  def mkdir
    `mkdir -p #{directory_path}`
  end

  def unzip
    `unzip #{zip_path} -d #{directory_path}`
  end

  def remove_zip
    `rm -rf #{zip_path}`
  end

  def build_photos
    Dir.glob("#{directory_path}/**/*.{jpeg,png,jpg}").sort.each_with_index do |raw_path, count|
      path = raw_path.gsub(Rails.root.join('public').to_s, '')
      Photo.create(album_id: id, img_path: path, page: count + 1)
    end
  end

  def update_page_num
    page_num = Photo.where(album_id: id).last.page unless Photo.where(album_id: id).last.nil?
    fail '画像データなし' if page_num.nil?
    update(page_num: page_num)
  end
end
