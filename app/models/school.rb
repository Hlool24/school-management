class School < ApplicationRecord
	validates :name_ar, :name_en, :status, presence: true
	validates :name_ar, :name_en, uniqueness: true

	enum :status, [:inactive, :active]

	def self.search(search)
		case search
		when 'active'
			@schools = self.where(status: 1)
		when 'inactive'
			@schools = self.where(status: 0)
		when ''
			@schools = self.all
		else 
			@schools = self.where(name_ar: search).or(self.where(name_en: search))
		end
	end
end
