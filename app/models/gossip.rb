class Gossip < ApplicationRecord
  belongs_to :user
  validates :title, presence: {message: ": Titre invalide"}, length: {in: 3..14, message: ": Titre en 3 et 4 caractères"}
  validates :content, presence: {message: ": Contenu invalide"}
end
