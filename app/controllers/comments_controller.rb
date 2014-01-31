class CommentsController < ApplicationController
 ####### 
    http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
 #######
 def create
    @post = Post.find(params[:post_id])
   @comment = @post.comments.create(params[:comment].permit(:commenter, :body)) #Note toself do not change this later (Per github issue #11)
    redirect_to post_path(@post)
  end
 #######
  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end
 #######
end
