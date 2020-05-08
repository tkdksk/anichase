class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @newpost = Post.new(:reply_id => params[:id],
      member_id: current_member&.id, name: current_member&.name)
    @posts = Post.where(reply_id: params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.save 
    redirect_to anime_path(params[:post][:anime_id]) if @post.reply_id.blank?
    redirect_to post_path(params[:post][:reply_id]) if @post.anime_id.blank?
  end

  private def post_params
    params.require(:post).permit(:anime_id, :member_id, :body, :name, :reply_id)
  end
end