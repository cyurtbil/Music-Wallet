class Wallet < ActiveRecord::Base
	belongs_to :user
	has_many :songs

	validates :name, presence: true, on: :create

  # scope :filtered, -> { where(checked: true) }
end