class SongsController < ApplicationController
	before_action :set_song, only: [:show, :edit, :update, :destroy]

	def index
		keyword = params[:q]
		@song = Song.new
		@song_ids = []

		client = Soundcloud.new(client_id: ENV['SOUNDCLOUD_CLIENT_ID'],
                        client_secret: ENV['SOUNDCLOUD_SECRET'])
		
		unless keyword.nil?
			@songs = client.get('/tracks', q: keyword, limit: 3)
			@song_ids = @songs.map(&:id)
		else
			@songs = []
		end

	end

	def show
	end

	def create
		@song = Song.create(song_params)
		redirect_to :back 
	end

	private

		def set_song
			@song = Song.find(params[:id])
		end

		def song_params
			params.require(:song).permit(:name, :user_id, :wallet_id, :track_id)
		end
end