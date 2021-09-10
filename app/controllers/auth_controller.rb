class AuthController < ApplicationController
    # before_action :require_login
    # User logging in -> post "/login", to: "auth#login"
    def login
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            payload = {user_id: user.id}
            token = encode_token(payload)
            render json: {user: user, jwt: token, success: "Welcome back, #{user.username}"}, methods: [:cities, :category_selections, :venue_selections, :city_profiles] 
        else
            render json: {failure: "Log in failed! Username or password invalid!"}
        end
    end

    def auto_login
        if session_user
            render json: session_user
        else
            render json: {errors: "No User Logged In"}
        end
    end

end
