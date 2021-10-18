class UsersController < ApplicationController
    def index
        @users = User.all
    end
    def new
        @user = User.new
    end
    def create
        @user = User.new(uid: params[:user][:uid],password: params[:user][:password],
        password_confirmation: params[:user][:password_confirmation])
        if @user.save 
          flash[:notice] = '登録完了'
          redirect_to root_path
        else
          render 'new'
        end
    end
    def destroy
        user = User.find(params[:id])
        if user.destroy
          flash[:notice] = 'ユーザー情報が削除されました'
        end
        redirect_to '/users'
    end
end
