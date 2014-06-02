class PostsController < ApplicationController

	before_action :authenticate_user!, except: [:index]

	def index
		@posts = Post.all
	end

	def create
		@post = Post.new(params[:post].permit(:title, :description, :picture, :tag_names))
		@post.user = current_user
		@post.save!

		redirect_to posts_path
	end


	def destroy
		@post = current_user.posts.find params[:id]
		@post.destroy
		
		flash[:notice] = 'Successfully deleted'

		rescue ActiveRecord::RecordNotFound
			flash[:alert] = "You are not allowed to delete someone's else posts!"
		ensure
		redirect_to '/posts'
	end

	def new
		@post = Post.new
	end

end
