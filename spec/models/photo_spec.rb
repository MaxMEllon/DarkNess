# == Schema Information
#
# Table name: photos
#
#  id         :integer          not null, primary key
#  album_id   :integer
#  page       :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  img_path   :string
#

require 'rails_helper'

RSpec.describe Photo, type: :model do
  context '関連テスト' do
    it 'belongs_to :album' do
      is_expected.to belong_to(:album)
    end
  end
end
