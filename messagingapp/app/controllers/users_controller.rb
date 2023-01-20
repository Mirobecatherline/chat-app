class UsersController < ApplicationController
    def index
        users= User.all
        render json: users
    end

    def create
        user = User.new(user_params)
        ActionCable.server.broadcast('user_channel', user) if user.save
        render json: user
    end

    def user_params
        params.require(:user).permit(:username, :status)
    end
end
