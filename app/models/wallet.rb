class Wallet < ActiveRecord:Base
	has_many :songs, through: :types
	has_many :types
	belongs_to :user
end