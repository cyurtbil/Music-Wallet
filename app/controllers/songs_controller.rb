class SongsController < ApplicationController
	def create
		@song = Song.create(song_params)
		redirect_to user_path(current_user) 
	end

	private

		def song_params
			params.require(:song).permit(:name, :user_id)
		end
end