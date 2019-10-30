class Gossip < ApplicationRecord
  belongs_to :user
  belongs_to :city
  validates :title, presence: true, length: {in: 3..25, message: ": Titre en 3 et 25 caractères"}
  validates :content, presence: true
end
