class Song < ActiveRecord::Base
	belongs_to :user
	belongs_to :wallet

	# validates :wallet_id, presence: true, on: :create
end