class Utilisateur < ApplicationRecord
	validates :nom, presence: true
	validates :prenom, presence: true
	validates :email, presence: true
	validates :pseudo, presence: true
	validates :promotion, presence: true
end
