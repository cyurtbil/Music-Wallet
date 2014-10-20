class HomeController < ApplicationController
	def show
		client = Soundcloud.new(client_id: ENV['SOUNDCLOUD_CLIENT_ID'],
                        client_secret: ENV['SOUNDCLOUD_SECRET'])
		@tracks = client.get('/tracks', :limit => 10, :order => 'hotness')
		
	end
end