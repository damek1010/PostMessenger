class PostsController < ApplicationController
	before_action :require_user

	def index
		@new_post = Post.new
		@posts = Post.order(created_at: :desc).all
	end
	
	def create
		@new_post = Post.new(post_params)
		if @new_post.save
			redirect_to '/posts'
		end
	end
	
	private
	def post_params
		params.require(:post).permit(:author, :comment)
	end
end
