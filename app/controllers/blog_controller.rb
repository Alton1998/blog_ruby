class BlogController < ApplicationController
    before_action :require_login
    def index
        @articles=Article.all
        @categories=Category.all
    end
    def article
        @articles=Article.where(category_id:params[:id])
        @categories=Category.all
        render 'blog/index'
    end
    def show
        @current_article=Article.find(params[:id])
        render 'blog/article'
    end
end
