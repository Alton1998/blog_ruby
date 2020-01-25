class SessionsController < ApplicationController
    def index
        @user=User.new
    end
    def create
        user=User.find_by(email:params[:email])
        if user&&user.authenticate(params[:password])
            session[:user_id]=user.id
            redirect_to blog_index_path
        else
            flash[:error_login]="Email or Password maybe wrong"
            redirect_back(fallback_location:root_path)
        end
    end
    def destroy
        reset_session
        redirect_to root_path
    end
end
