class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_post, only: [:edit, :update, :destroy]

  def index
  	@posts = Post.all
  end

  def show
  	@post = Post.find(params[:id]) if params[:id]
  end

  def my_posts
  	@posts = current_user.posts
  end

  def new
    @post = Post.new
  end
 
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id if current_user
    if @post.save
      flash[:success] = "Post Created Successfully"
      redirect_to @post
    else
      flash[:danger] = @post.errors.full_messages
	    redirect_to new_post_path
    end
  end

  def edit
  end

  def update
  	@post.user_id = current_user.id if current_user
    if @post.update(post_params)
    	flash[:success] = "Post Updated Successfully"
      redirect_to @post
    else
    	flash[:danger] = @post.errors.full_messages
      render 'edit'
    end
  end


  def destroy
  	if @post
      @post.destroy 
      flash[:success] = 'Post Deleted Succesfully'
    end
    redirect_to posts_path
  end

  private

    def set_post
    	unless current_user
    	  redirect_to posts_path
    	else
    		@post = current_user.posts.find(params[:id]) if params[:id]
    	end
    end

    def post_params
   	  params.require(:post).permit(:title, :description)
    end
end
