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
      @tweet.save
      redirect_to '/'
    end
end
