class Annonce < ApplicationRecord
	belongs_to :utilisateurs
	has_one :utilisateurs
	validates :titre, presence: true
	validates :description, presence: true
	#validates :prix, exclusion: { is: >0 }
	validates :photo, presence: true
end
