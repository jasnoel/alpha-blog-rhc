class UsersController < ApplicationController

    before_action :set_user, only: [:edit, :show, :update]
    before_action :require_same_user, only: [:edit, :update, :delete]

    def index
        @users = User.paginate(page: params[:page], per_page: 5)
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            flash[:success] = "Votre compte a bien été créé #{@user.username} !"
            redirect_to user_path(@user)
        else
            render 'new'
        end
    end

    def show
        @user_articles = set_user.articles.paginate(page: params[:page], per_page: 10)
    end

    def edit
    end

    def update
        if @user.update(user_params)
            flash[:success] = "Votre compte est bel et bien modifié #{@user.username} !"
            redirect_to user_path(@user)
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

    def require_same_user
        if @user != current_user
            flash[:danger] = "t'es un fou dans ta tête toi ! tu t'es prit pour qui ?!"
            redirect_to user_path(@user)
        end
    end
end