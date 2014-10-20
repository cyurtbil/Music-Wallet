class UsersController < ApplicationController
	def show
	 # binding.pry
	 @wallet = Wallet.new(user_id: current_user.id)
   @wallets = current_user.wallets
	end
end