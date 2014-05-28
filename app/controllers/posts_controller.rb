class PostsController < ApplicationController

	def index
		@post = Post.new
	end

	def create
		@post = Post.new(params[:post].permit(:title, :description))
			if @post.save
			redirect_to '/'
		end
	end

end
