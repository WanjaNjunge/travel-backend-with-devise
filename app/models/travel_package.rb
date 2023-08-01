class TravelPackage < ApplicationRecord
  belongs_to :user
  belongs_to :destination

  validates :name, presence: true
  validates :description, presence: true
  validates :image_url, presence: true
  validates :pricing, presence: true
  validates :itinerary, presence: true
  validates :booking_status, presence: true
end
