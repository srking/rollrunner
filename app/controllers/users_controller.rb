class UsersController < ApplicationController

    before_filter :authenticate_user!

    def create
        User.create(user_params)
    end

    private

    def user_params
        params.require(:user).permit(:email, :given_name, :family_name, :domain, :provider, :uid, :password, :remember_me)
    end

end
