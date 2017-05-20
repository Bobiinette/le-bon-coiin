class Annonce < ApplicationRecord
	has_one :utilisateurs
	validates :titre, presence: true
	validates :description, presence: true
	validates :prix, presence: true
	validates :photo, presence: true
end
