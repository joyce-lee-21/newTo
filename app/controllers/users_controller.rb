class UsersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index
        users = User.all
        render json: users
    end

    def show
        user = User.find(params[:id])
        render json: user
    end

    def create
        user = User.create(user_params)
        render json: user, status: :created
    rescue ActiveRecord::RecordInvalid => e
        render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity

    end

    def update
        user = User.find(params[:id])
        user.update(user_params)
        render json: user, status: :accepted
    rescue ActiveRecord::RecordInvalid => e
        render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
    end

    private

    def user_params
        params.require(:user).permit(:name, :username, :password)
    end

    def render_not_found_response
        render json: { error: "Item not found" }, status: :not_found
    end

end
