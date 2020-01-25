class ArticlesController < ApplicationController
    before_action :require_login
    def index
    end
    def create
        article=Article.new
        article.title=params[:title]
        article.text=params[:text]
        u=User.find(session[:user_id])
        article.user_id=u.id
        category=Category.find_by(name:params[:category])
        if category
            article.category_id=category.id
        else
            new_category=Category.new(name:params[:category])
            if new_category.save
                flash[:new_category]="New Category Created"
                article.category_id=new_category.id
            else
                flash[:new_category_errors]="Unable to Create Category"
                redirect_back(fallback_location:articles_path)
            end
        end
        if article.save
            flash[:article]="Article saved"
            redirect_to blog_index_path
        else
            flash[:article_errors]=article.errors.full_messages
            redirect_back(fallback_location:articles_path)
        end
    end
end
