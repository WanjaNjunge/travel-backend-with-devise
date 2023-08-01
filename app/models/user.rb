class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  has_many :travel_experiences, dependent: :destroy
  has_many :destinations, dependent: :destroy
  has_many :travel_packages, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy


  validates :username, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable,
          :jwt_authenticatable, jwt_revocation_strategy: self


  def jwt_payload
    super
  end
end
