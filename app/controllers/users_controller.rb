class UsersController < ApplicationController

	def index
	 	@users = User.all
	 	@wallets = Wallet.all
	end

end