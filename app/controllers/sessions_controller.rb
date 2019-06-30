class SessionsController < ApplicationController

    def new

    end

    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            flash[:success] = "Félicitation pour cette incroyable connexion !"
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            flash.now[:danger] = "Identifants incorrects mon ptit pote"
            render 'new'
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:success] = "Aurevoir !"
        redirect_to root_path
    end
end