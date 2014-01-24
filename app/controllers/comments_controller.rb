class CommentsController < ApplicationController
 def create
    @post = Post.find(params[:post_id])
   @comment = @post.comments.create(params[:comment].permit(:commenter, :body)) #Note toself do not change this later (Per github issue #11)
    redirect_to post_path(@post)
  end
end
