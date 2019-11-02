class User < ApplicationRecord
  has_secure_password
  has_many :gossips, dependent: :destroy
  belongs_to :city
  has_many :comments, dependent: :destroy
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :city, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
end
