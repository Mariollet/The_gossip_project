class User < ApplicationRecord
  has_secure_password
  has_many :gossips
  belongs_to :city
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :city, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
end
