class Song < ActiveRecord:Base
	has_many :wallets, through: :types
	has_many :types
end