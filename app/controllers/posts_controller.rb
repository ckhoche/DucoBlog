class PostsController < ApplicationController
  http_basic_authenticate_with name: "duco1@test.com", password: "secret", except: [:index, :show]
  
  def index
      @posts = Post.all
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def new
    @post = Post.new
  end
  
  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(params.require(:post).permit(:title, :text))
   
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
end

def update
  @post = Post.find(params[:id])
 
  if @post.update(article_params)
    redirect_to @post
  else
    render 'edit'
  end
end

def destroy
  @post = Post.find(params[:id])
  @post.destroy
 
  redirect_to articles_path
end

private
  def post_params
    params.require(:post).permit(:title, :text)   
  end
end
