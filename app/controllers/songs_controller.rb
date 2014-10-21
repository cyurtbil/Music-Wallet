class SongsController < ApplicationController
	before_action :set_song, only: [:show, :edit, :update, :destroy]

	def show
		binding.pry
		client = Soundcloud.new(client_id: ENV['SOUNDCLOUD_CLIENT_ID'],
                        client_secret: ENV['SOUNDCLOUD_SECRET'])

		if current_user.songs != []
   		@songs = client.get('/tracks', q: "#{current_user.songs.last.search}", limit: 3)
   	else
   		@songs = client.get('/tracks', q: "#{@song.search}", limit: 3)
		end
	end

	def create
		@song = Song.create(song_params)
		redirect_to user_path(current_user) 
	end

	private

		def set_song
			@song = Song.find(params[:id])
		end

		def song_params
			params.require(:song).permit(:name, :user_id, :wallet_id, :type)
		end
end