class UsersController < ApplicationController
    def index
        @users = User.all
    end
    
    def new # ユーザ登録用画面生成(app/views/users/new.html.erbに対応。form_for(@user) で使用するため、ここで生成している)
        @user = User.new
    end
    
    def create # ユーザ登録実行
        @user = User.new(user_params)
        
        if @user.save
            redirect_to users_url
        else
            render 'new'
        end
    end
    
    private
    def user_params
        params.require(:user).permit(:name, :department)
    end
    
end
