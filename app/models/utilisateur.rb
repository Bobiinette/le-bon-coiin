class Utilisateur < ApplicationRecord
	has_many :annonces, dependant: :destroy
	validates :nom, presence: true
	validates :prenom, presence: true
	validates :email, presence: true
	validates :pseudo, presence: true
	validates :promotion, presence: true
end
