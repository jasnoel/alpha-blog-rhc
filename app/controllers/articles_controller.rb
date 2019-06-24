class ArticlesController < ApplicationController

    before_action :get_article, only: [:show, :edit, :update, :destroy]

    def index
        @articles = Article.all
    end

    def show
    end

    def edit
    end

    def update
        if @article.update(article_params)
            flash[:success] = "l'article bel et bien modifié !"
            redirect_to article_path(@article)
        else
            render 'edit'
        end
    end

    def new
        @article = Article.new
    end

    def create
        @article = Article.new(article_params)
        #Triche en attendant
        @article.user = User.first
        if @article.save
            flash[:success] = "l'article bel et bien créé !"
            redirect_to article_path(@article)
        else
            render 'new'
        end
    end

    def destroy
        get_article
        @article.destroy
        flash[:danger] = "Article supprimé"
        redirect_to articles_path
    end

    private

    def get_article
        @article = Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title, :description)
    end

end