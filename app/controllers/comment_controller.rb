class CommentController < ApplicationController

	def new
		@post = Post.find params[:post_id]
		@comment = Comment.new
	end

	def create
		@post = Post.find params[:post_id]
		@post.comment.create
		redirect_to '/posts'
	end
end
