class PostsController < ApplicationController
 def new
  end
  
  def create
    # render text: params[:post].inspect #Debug dump submitted text to screen to test submition without page generation.
    @post = Post.new(post_params) #Take submitted post and make new page
    @post.save #Save new page
    redirect_to @post #reroute submit user to the posted page
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  private
  def post_params
    params.require(:post).permit(:title, :text)
  end
end