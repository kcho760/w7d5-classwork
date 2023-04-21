class SessionsController > ApplicationController

    before_action :require_logged_in, only: [:destroy]


    def new
        @user = User.new
    end

    def create
    @user = User.find_by_credentials (
        params[:user][:username]
        params[:user][:password]
        )

    if @user
        login!(user)
        redirect_to user_url(@user)
    else
        flash.new[:errors] = @user.error.full_messages
        render :new

    end

    def destroy

    end
end
