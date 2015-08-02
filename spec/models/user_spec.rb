require 'rails_helper'

RSpec.describe User, type: :model do
  context '関連テスト' do
    it 'has_many :events' do
      is_expected.to have_many(:events)
    end
  end
end
