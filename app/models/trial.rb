class Trial < ActiveRecord::Base
	validates :title, :description, :sponsor, :country, :focus, presence: true
	has_many :sites
end
