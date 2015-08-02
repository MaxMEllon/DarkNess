class Event < ActiveRecord::Base
  has_many :albums
  # belongs_to :user
end
