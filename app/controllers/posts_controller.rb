class PostsController < ApplicationController
  def show
  end

  def index
  end

  def create
  	new_post = Post.new(post_params)
    new_post.user_id = current_user.id
  	new_post.save

  	redirect_to user_path(current_user)
  end

  private
    def post_params
      params.require(:post).permit(:title, :body, :post_image)
    end
    
end
