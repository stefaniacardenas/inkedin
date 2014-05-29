class PostsController < ApplicationController

	before_action :authenticate_user!, except: [:index]

	# def new
	# 	@post = Post.new
	# end

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
