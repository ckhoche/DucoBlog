class PostsController < ApplicationController
  def new
  end
 
  def create
    @post = Post.new(params.require(:post).permit(:title, :text))
   
    @post.save
    redirect_to @post
end

private
  def article_params
    params.require(:post).permit(:title, :text)   
  end
end
