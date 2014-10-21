class UsersController < ApplicationController
	def show
		
	 @wallet = Wallet.new(user_id: current_user.id)
   @wallets = current_user.wallets
	 @song = Song.new(user_id: current_user.id)
   @songs = current_user.songs
   client = Soundcloud.new(client_id: ENV['SOUNDCLOUD_CLIENT_ID'],
                        client_secret: ENV['SOUNDCLOUD_SECRET'])
   @tracks = client.get('/tracks', q: "#{current_user.songs.last.name}")
	end
end