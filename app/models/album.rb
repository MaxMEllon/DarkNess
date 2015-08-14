class Album < ActiveRecord::Base
  has_many :photos
  belongs_to :event

  def unzip_and_bind_photos
    directory = Rails.root.join('public', self.id.to_s)
    system("mkdir #{directory}")
    system("unzip #{self.zip_path} -d #{directory}")
    Dir.glob("#{directory}/*.{jpeg,png,jpg}").each do |img_path|
    end
  end
end
