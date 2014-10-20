class SongsController < ApplicationController
	def new
		@song = Song.new(song_params)
		redirect_to user_path(current_user) 
	end

	private

		def song_params
			params.require(:song).permit(:name, :user_id)
		end
end