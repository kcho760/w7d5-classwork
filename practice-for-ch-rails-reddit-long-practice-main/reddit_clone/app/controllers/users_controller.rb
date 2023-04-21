class UsersControllers < ApplicationController
    before_action :require_logged_in, only: [:destroy]
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            login!(@user)
            redirect_to session_url#maybe user_url
        else
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end
    end

    def index
        @user = User.all
    end
    
    def show
        @user = User.find(params[:id])
    end

    def destroy
        @user = User.find_by(id: params[:id])
        @user.delete
        redirect_to new_session_url
    end
    
    private
    def user_params
        params.require(:user).permit(:username, :password)
    end
end
