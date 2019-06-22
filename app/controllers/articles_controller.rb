class ArticlesController < ApplicationController

    def show
        @article = Article.find(params[:id])
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
            #flash[:notice] = @article.errors.full_messages
            render 'new'
        end
    end

    private

    def article_params
        params.require(:article).permit(:title, :description)
    end

end