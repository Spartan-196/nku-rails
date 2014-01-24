class PostsController < ApplicationController
########
  def new
  @post = Post.new
 end
########
 def create
  # render text: params[:post].inspect #Debug dump submitted text to screen to test submition without page generation.
  @post = Post.new(params[:post].permit(:title, :text)) 
 
  if @post.save #Validation check before save
    redirect_to @post#If it fails go back to post
  else
    render 'new' #if good make new post from submited fields
  end
 end
########   
  def edit
     @post = Post.find(params[:id])
 
  if @post.update(params[:post].permit(:title, :text))
    redirect_to @post
  else
    render 'edit'
  end
  end
########
  def show
    @post = Post.find(params[:id])
  end
########
  def index
    @posts = Post.all 
  end
########  
  private
  def post_params
    params.require(:post).permit(:title, :text)
  end
########
end 

