class Wallet < ActiveRecord::Base
	belongs_to :user
	has_many :songs
end