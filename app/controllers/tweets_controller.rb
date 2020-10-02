class TweetsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @tweets = Tweet.order("created_at DESC")
  end

  def new
    @tweets = Tweet.new
  end

  def create
    @tweets = Tweet.create(tweet_params)
    if @tweets.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    if @tweets.update(tweet_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @tweets.destroy
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
    @tweets = Tweet.find(params[:id])
  end
end