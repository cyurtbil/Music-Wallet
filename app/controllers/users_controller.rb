class UsersController < ApplicationController
	def show
	 # binding.pry
	 @wallet = Wallet.new(user_id: current_user.id)
   @wallets = current_user.wallets
   @songs = current_user.songs
   client = Soundcloud.new(client_id: ENV['SOUNDCLOUD_CLIENT_ID'],
                        client_secret: ENV['SOUNDCLOUD_SECRET'])
   @tracks = client.get('/tracks', q: 'Re Dupre @ 100% Fresh')
	end
end