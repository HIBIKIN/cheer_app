class PostsController < ApplicationController
  before_action :set_post, only: [:show]


  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to @post, notice: "投稿しました。"
  end

  def show
  end

  private

    def post_params
      params.require(:post).permit(:body)
    end

    def set_post
      @post = Post.find(params[:id])
    end
end
