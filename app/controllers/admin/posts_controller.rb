class Admin::PostsController < Admin::Base
  def index
  end

  def search
    @post = Post.search(params[:search])
    render "index"
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to :admin_posts, success: "投稿を削除しました。"
  end
end