class UsersController < ApplicationController
	
	def show
	 @wallet = Wallet.new(user_id: current_user.id)
   @wallets = current_user.wallets
   @song = Song.new(user_id: current_user.id)
		# @tracks.each do |track|
		# 	@song.update_attributes(type: track.id)
		# end

	end

end