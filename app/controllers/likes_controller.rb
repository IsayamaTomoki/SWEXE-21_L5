class LikesController < ApplicationController
    def create
      tweet = Tweet.find(params[:tweet_id])
      user = User.find_by(uid: session[:login_uid])
      if Like.find_by(user_id: user.id, tweet_id: tweet.id)
        flash[:notice] = '既にいいねを付けたツイートです'
        redirect_to root_path
      else
        user.like_tweets << tweet
        flash[:notice] = 'いいねを付けました'
        redirect_to root_path
      end
    end
    def destroy
      tweet = Tweet.find(params[:id])
      user = User.find_by(uid: session[:login_uid])
      if Like.find_by(user_id: user.id, tweet_id: tweet.id)
        tweet.likes.find_by(user_id: user.id).destroy
        flash[:notice] = 'いいねを削除しました'
        redirect_to root_path
      else
        flash[:notice] = '該当ツイートにはいいねが付いていません'
        redirect_to root_path
      end
    end
end
