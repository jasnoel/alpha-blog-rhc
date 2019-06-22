class ArticlesController < ApplicationController

    def index
        @articles = Article.all
    end

    def show
        @article = Article.find(params[:id])
    end

    def edit
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])
        if @article.update(article_params)
            flash[:notice] = "l'article bel et bien modifié !"
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
        if @article.save
            flash[:notice] = "l'article bel et bien créé !"
            redirect_to article_path(@article)
        else
            render 'new'
        end
    end

    private

    def article_params
        params.require(:article).permit(:title, :description)
    end

end