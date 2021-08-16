class UsersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    # skip_before_action :authorize, only: :create

    def index
        @users = User.all
        render json: @users
    end

    def show
        @user = User.find(id: params[:id])
        # byebug
        if @user
            render json: @user
        else
            render json: { error: "User not Authorized" }, status: :unauthorized
        end
        # render json: current_user
        # byebug
    end

    def create
        @user = User.create(user_params)
        city_profile = CityProfile.create(user_id: user.id, city: params[:city])
        if @user.valid?
            # session[:user_id] = user.id
            login!
            render json: @user, status: :created
        else
        render json: {error: user.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        render json: @user, status: :accepted
    rescue ActiveRecord::RecordInvalid => e
        render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
    end

    private

    def user_params
        params.permit(:name, :username, :password)
    end

    def render_not_found_response
        render json: { error: "User not found" }, status: :not_found
    end

end
