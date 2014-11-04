class UsersController < ApplicationController

	def index
	 	@users = User.all
	 	@wallets = Wallet.all
    @filtered = Wallet.where('name IN (?)', params[:names])
    @h = Hash.new(0)
	end

end