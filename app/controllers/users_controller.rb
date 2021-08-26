class UsersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    before_action :logged_in?, only: :get_user

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
        if user.valid?
            render json: {user: user, token: JWT.encode({user_id: user.id}, "randomstring")}, status: :created
        else
        render json: {error: user.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def login
        user = User.find_by(username: params[:username])
        if user&.authenticate(params[:password])
            # byebug
            render json: {user: user, token: JWT.encode({user_id: user.id}, "randomstring")}, methods: [:cities, :category_selections, :venue_selections, :city_profiles]
        else
            render json: { errors: ["Invalid username or password"] }, status: :unauthorized
        end
    end

    def get_user
        user = self.current_user
        render json: user
    end

    def update
        user = User.find_by(id: params[:id])
        user.update(user_params)
        render json: user, status: :accepted
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
