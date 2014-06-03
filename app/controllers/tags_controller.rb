class TagsController < ApplicationController

	def show
		@tag = Tag.find_by(name: '#' + params[:id])
	end

	# We used the method .find_by because the method find will only look for the id
	# but in this case we want the name.

end
