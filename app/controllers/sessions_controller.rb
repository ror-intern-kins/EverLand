class SessionsController < ApplicationController
    def create
        user = User.find_by(username: params[:session][:username].downcase)
        if user && user.password == params[:session][:password]
            user.password = 'Ahihi' #tạm thời
            log_in user
            
            render json: [login_in?, session[:user_id], user], status: 200
        else
            render status: 404
        end
    end
    def destroy
        log_out
        render status: 200
    end
    private
        def log_in(user)
            session[:user_id] = user.id
        end
        def current_user
            @current_user ||= User.find_by(id: session[:user_id])
        end
        def login_in?
            !current_user.nil?
        end
        def log_out
            session.delete(:user_id)
            @current_user = nil
        end
end
