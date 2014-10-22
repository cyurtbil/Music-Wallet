class HomeController < ApplicationController
	def show
		@song = Song.new

		client = Soundcloud.new(client_id: ENV['SOUNDCLOUD_CLIENT_ID'],
                        client_secret: ENV['SOUNDCLOUD_SECRET'])
		@songs = client.get('/tracks', limit: 5, order: 'hotness')
	end
end