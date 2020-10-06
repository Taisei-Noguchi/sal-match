class TweetsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit]
  before_action :move_to_index, except: [:index, :show]

  def index
    @tweets = Tweet.order("created_at DESC")
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.create(tweet_params)
    if @tweet.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @tweet.comments.includes(:user)
  end

  def update
    tweet = Tweet.find(params[:id])
    if tweet.update(tweet_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    tweet = Tweet.find(params[:id])
    if tweet.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit( :image, :title, :place, :price, :detail,:category_id, :prefecture_id, :field_id, :level_id).merge(user_id: current_user.id)
  end

  def set_item
    @tweet = Tweet.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end