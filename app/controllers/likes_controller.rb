class LikesController < ApplicationController

	def create
		@post = Post.find params[:post_id]
		@post.likes.create

		WebsocketRails[:likes].trigger 'new' , { id: @post.id, new_like_count: @post.likes.count }
		# This is a websocket massege that will be broadcasted on a channel
		# The channel is called :likes.
		# The action that will be triggered is 'new', a new like has been created and finally we want the new like count.
		redirect_to '/posts'
	end
end
