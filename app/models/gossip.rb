class Gossip < ApplicationRecord
  belongs_to :user
  belongs_to :city
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: {in: 2..25, message: ": Titre en 2 et 25 caractères"}
  validates :content, presence: true
end
