# app/controllers/reviews_controller.rb

class ReviewsController < ApplicationController
  before_action :set_post, only: [:new, :create, :destroy]
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.attributes = {
      post_id: params[:post_id],
      user_id: current_user.id
    }
    if @review.save
      redirect_to @review.post, notice: "レビューを登録しました。"
    else
      render :new
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to @review.post, notice: "レビューを削除しました。"
  end

  private

  def review_params
    params.require(:review).permit(:comment)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
