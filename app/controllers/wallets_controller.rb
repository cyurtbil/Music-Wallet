class WalletsController < ApplicationController
	before_action :set_wallet, only: [:show, :edit, :update, :destroy]


	def index
		@wallets = Wallet.all
	end

	def show
		@songs = @wallet.songs
	end

	def new
		@wallet = Wallet.new
	end

	def create
		@wallet = Wallet.create(wallet_params)
		redirect_to wallets_path
	end

	private

		def set_wallet
			@wallet = Wallet.find(params[:id])
		end

		def wallet_params
			params.require(:wallet).permit(:name, :user_id)
		end
end