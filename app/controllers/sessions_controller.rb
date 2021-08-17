class SessionsController < ApplicationController
    # skip_before_action :authorize, only: :create

    def create
        user = User.find_by(username: params[:username])
        if user&.authenticate(params[:password])
            session["init"] = true
            session[:user_id] = user.id
            render json: user
        else
            render json: {errors: user.errors.full_messages}, status: :unauthorized
            # render json: { errors: ["Invalid username or password"] }, status: :unauthorized
        end
        # byebug
    end

    def destroy
        session.delete(:user_id)
        head :no_content
    end
end
