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

require 'rails_helper'

RSpec.describe Album, type: :model do
  context '関連テスト' do
    it 'has_many :photos' do
      is_expected.to have_many(:photos)
    end
    it 'belongs_to :event' do
      is_expected.to belong_to(:event)
    end
  end
end
