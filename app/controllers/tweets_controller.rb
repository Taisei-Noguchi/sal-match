class TweetsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @tweets = Tweet.order("created_at DESC")
  end
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
  params.require(:tweet).permit(:title, :prefectures_id, :place, :field_id, :category_id, :level_id, :price, :detail, :image).merge(user_id: current_user.id)
end