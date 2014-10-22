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
		if @wallet.save
			redirect_to wallets_path
		else
			render :new
		end
	end

	def edit
	end

	def update
		@wallet.update(wallet_params)
		if @wallet.update(wallet_params)
			redirect_to wallet_path(@wallet)
		else
			render :edit
		end
	end

	def destroy
			@wallet.destroy
			redirect_to :back 
	end

	private

		def set_wallet
			@wallet = Wallet.find(params[:id])
		end

		def wallet_params
			params.require(:wallet).permit(:name).merge(user_id: current_user.id)
		end
end