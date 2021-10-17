class TweetsController < ApplicationController
    def index
      @tweets = Tweet.all
    end
    def new
      @tweet = Tweet.new
    end
    def create
      message = params[:tweet][:message]
      @tweet = Tweet.new(message: message)
      if @tweet.save 
        flash[:notice] = 'ツイートしました'
        redirect_to '/'
      else
        render 'new'
      end
    end
end
