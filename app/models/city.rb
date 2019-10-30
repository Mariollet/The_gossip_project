class City < ApplicationRecord
  has_many :user
  has_many :gossip
  validates :name, presence: true
end
