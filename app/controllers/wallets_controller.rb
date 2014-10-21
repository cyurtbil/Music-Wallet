class WalletsController < ApplicationController

	def show
		@wallet = Wallet.find(params[:id])
	end

	def create
		@wallet = Wallet.create(wallet_params)
		redirect_to user_path(current_user) 
	end

	private

		def wallet_params
			params.require(:wallet).permit(:name, :user_id)
		end
end