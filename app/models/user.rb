class User < ApplicationRecord
  has_many :gossips
  belongs_to :city
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :city, presence: true
end
