class TweetsController < ApplicationController
    def index
      @tweets = Tweet.all
    end
    def new
      @tweet = Tweet.new
    end
    def create
      message = params[:tweet][:message]
      user = User.find_by(uid: session[:login_uid])
      @tweet = Tweet.new(message: message, user_id: user.id)
      if @tweet.save 
        flash[:notice] = 'ツイートしました'
        redirect_to '/'
      else
        render 'new'
      end
    end
    def destroy
      tweet = Tweet.find(params[:id])
      if tweet.destroy
        flash[:notice] = 'ツイートが削除されました'
      end
      redirect_to root_path
    end
end
