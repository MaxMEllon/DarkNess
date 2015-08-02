require 'rails_helper'

RSpec.describe Photo, type: :model do
  context '関連テスト' do
    it 'belongs_to :album' do
      is_expected.to belong_to(:album)
    end
  end
end
