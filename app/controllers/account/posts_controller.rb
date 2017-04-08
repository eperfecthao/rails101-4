class Account::PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = current_user.posts
  end

  def edit
      @post = Post.find(params[:id])
  end

  def update
      @post = Post.find(params[:id])
    if current_user && current_user == @post.user
      @post.update(post_params)

      redirect_to account_posts_path, notice: "更新成功"
    else
      render root_path, alert: "You have no permission"
    end
  end

  def destroy
      @post = Post.find(params[:id])
      @post.destroy
      redirect_to account_posts_path, alert: "文章删除"
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

end
