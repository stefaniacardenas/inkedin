class PostsController < ApplicationController

	def index
		@posts = Post.all
		@post = Post.new
	end

	def create
		@post = Post.new(params[:post].permit(:title, :description, :picture))
			if @post.save
			redirect_to '/'
		end
	end

end
