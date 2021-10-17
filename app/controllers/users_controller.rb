class UsersController < ApplicationController
    def index
        @users = User.all
    end
    def new
        @user = User.new
    end
    def create
        uid = params[:user][:uid]
        pass = BCrypt::Password.create(params[:user][:pass])
        @user = User.new(uid: uid, pass: pass)
        if @user.save 
          flash[:notice] = '登録完了'
          redirect_to '/top/main'
        else
          render 'new'
        end
    end
    def destroy
        user = User.find(params[:id])
        user.destroy
        redirect_to '/users'
    end
end
