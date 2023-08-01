class Destination < ApplicationRecord
  belongs_to :user

  validates :location, presence: true
  validates :country, presence: true
  validates :image_url, presence: true
end
