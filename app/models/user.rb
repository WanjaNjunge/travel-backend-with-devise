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

  
  
    enum role: { admin: 0, tour_operator: 1, traveller: 2 }

    def admin?
      role == 'admin'
    end
  
    def tour_operator?
      role == 'tour_operator'
    end
  
    def traveller?
      role == 'traveller'
    end

  def jwt_payload
    super
  end
end
