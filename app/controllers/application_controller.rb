class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    def current_user
        User.find(session[:user_id]) if session[:user_id]
    end
    def require_login
        unless session[:user_id]
            flash[:error_login]="You must first sign in"
            redirect_to root_path
        end
    end
end
