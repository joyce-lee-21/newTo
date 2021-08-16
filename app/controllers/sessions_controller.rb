class SessionsController < ApplicationController
    # skip_before_action :authorize, only: :create

    def create
        @user = User.find_by(username: session_params[:username])
        if @user && @user.authenticate(session_params[:password])
            # session["init"] = true
            login!
            render json: { 
                logged_in: true, 
                user: @user, include: [:cities, :category_selections, :venue_selections], 
                status: :ok
            }
        else
            render json: {errors: "no such user, please try again"}, status: :unauthorized
            # render json: { errors: ["Invalid username or password"] }, status: :unauthorized
        end
        # byebug
    end

    # def create
    #     user = User.find_by(username: params[:username])
    #     if user&.authenticate(params[:password])
    #         # session["init"] = true
    #         session[:user_id] = user.id
    #         render json: user
    #     else
    #         render json: {errors: user.errors.full_messages}, status: :unauthorized
    #         # render json: { errors: ["Invalid username or password"] }, status: :unauthorized
    #     end
    #     # byebug
    # end

    def is_logged_in?
        if logged_in? && current_user
          render json: {
            logged_in: true,
            user: current_user,
            status: :ok
          }
        else
          render json: {
            logged_in: false,
            message: 'no such user'
          }
        end
    end

    def destroy
        logout!
        render json: {
            status: :ok,
            logged_out: true
        }
    end

    private

    def session_params
        params.require(:user).permit(:username, :password)
    end
end
