class Album < ActiveRecord::Base
  has_many :photos
  belongs_to :event
  before_destroy :remove_photos

  def unzip_and_bind_photos
    directory_path = Rails.root.join('public', 'images', id.to_s)
    system("mkdir #{directory_path}")
    system("unzip #{zip_path} -d #{directory_path}")
    build_photos(directory_path)
    update_page_num
    system("rm -rf #{zip_path}")
  end

  def remove_photos
    directory_path = Rails.root.join('public', 'images', id.to_s)
    system("rm -rf #{directory_path}")
  end

  private

  def build_photos(directory_path)
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
