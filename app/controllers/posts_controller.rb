class PostsController < ApplicationController
def index
	@posts = Post.all
end
def show
	@post = Post.find(params[:id])
end
def new
	@post = Post.new
end
def create
	@post = Post.new(params[:post])
	if @post.save
		redirect_to posts_path, :notice => "Successfully created!"
	else
		render "new"
	end
end
def edit
	@post = Post.find params[:id]
end
def update
	@post = Post.find params[:id]
	@post.update_attributes!(params[:post])
	flash[:notice] = "#{@post.title} was successfully updated."
	redirect_to post_path(@post)
end
def destroy
	@post = Post.find(params[:id])
	@post.destroy
	#flash[:notice] = "Post '#{@post.title}' deleted."
	redirect_to posts_path
end
end
