class Album < ActiveRecord::Base
  has_many :photos
  belongs_to :event

  def unzip_and_bind_photos
    directory = Rails.root.join('public', 'images', id.to_s)
    system("mkdir #{directory}")
    system("unzip #{zip_path} -d #{directory}")
    Dir.glob("#{directory}/**/*.{jpeg,png,jpg}").sort.each_with_index do |img_path, count|
      Photo.create(album_id: id, img_path: img_path, page: count + 1)
    end
    update(page_num: Photo.last.page)
  end
end
