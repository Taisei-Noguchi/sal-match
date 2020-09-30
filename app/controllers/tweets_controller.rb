class TweetsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

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

  private

  def tweet_params
    params.require(:tweet).permit( :image, :title, :place, :price, :detail, :prefecture_id, :field_id, :level_id).merge(user_id: current_user.id)
  end
end