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
