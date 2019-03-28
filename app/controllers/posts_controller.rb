class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create]


  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to @post, notice: "投稿しました。"
    else
      render new_post_path
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.user_id == current_user.id
      @post.update(post_params)
      redirect_to @post, notice: "編集しました"
    else
      redirect_to @post, alert: "編集権限がありません"
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "削除しました"
  end

  private

    def post_params
      params.require(:post).permit(:body)
    end

    def set_post
      @post = Post.find(params[:id])
    end
end
