require 'rails_helper'

RSpec.describe Event, type: :model do
  context '関連テスト' do
    it 'has_many :albums' do
      is_expected.to have_many(:albums)
    end
    it 'belongs_to :user' do
      is_expected.to belong_to(:user)
    end
  end
end
