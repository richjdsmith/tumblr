class CommentsController < ApplicationController

  def create
    find_post
    @comment = @post.comments.create(params[:comment].permit(:name, :body))
    redirect_to post_path(@post)
  end

  def destroy
    find_post
    @comment = @post.comments.find(params[:id])
    @comment.destroy

    redirect_to post_path(@post)
  end


  private

  def find_post
    @post = Post.find(params[:post_id])
  end

end
