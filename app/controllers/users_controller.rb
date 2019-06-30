class UsersController < ApplicationController

    before_action :set_user, only: [:edit, :show, :update]

    def index
        @users = User.paginate(page: params[:page], per_page: 5)
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:success] = "Votre compte a bien été créé #{@user.username} !"
            redirect_to articles_path
        else
            render 'new'
        end
    end

    def show
        @user_articles = set_user.articles.paginate(page: params[:page], per_page: 10)
    end

    def edit
        redirect_to user_path(@user) if !(logged_in? and @user == current_user)
    end

    def update
        if @user.update(user_params)
            flash[:success] = "Votre compte est bel et bien modifié #{@user.username} !"
            redirect_to articles_path
        else
            render 'edit'
        end
    end

    private

    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
end