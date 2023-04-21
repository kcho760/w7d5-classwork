class ApplicationController < ActionController::Base
    #CHRLLL
    skip_before_action :authenticate_user_from_token!
    
    helper_method :current_user, :logged_in?, :login!(user), :logout!, :require_logged_in

    def current_user
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def logged_in?
        !!current_user
    end

    def login!(user)
        # session[:session_token] = user.find_by_credentials(
        #     params[:user][:username]
        #     params[:user][:password]
        # )
        @current_user = user
        session[:session_token] = user.reset_session_token!
    end

    def logout!
        session[:session_token] = nil
        current_user.reset_session_token!
    end

    def require_logged_in
        redirect_to new_session_url unless logged_in?
    end
end
