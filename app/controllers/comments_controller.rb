class CommentsController < ApplicationController

	def new
		@post = Post.find params[:post_id]
		@comment = Comment.new(params[:comment].permit(:body))
	end

	def create
		@post = Post.find params[:post_id]
		@post.comments.new
		@post.save
		
		redirect_to '/posts'
	end

end
