class Annonce < ApplicationRecord
	has_one :utilisateurs
	validates :titre, presence: true
	validates :description, presence: true
	#validates :prix, exclusion: { is: >0 }
	validates :photo, presence: true
end
