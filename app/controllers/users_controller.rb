class UsersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    # before_action :logged_in?, only: :get_user

    def index
        users = User.all
        render json: users
    end

    def show
        user = User.find_by(id: session[:user_id])
        # byebug
        if user
            render json: user
        else
            render json: { error: "Not Authorized" }, status: :unauthorized
        end
        # render json: current_user
        # byebug
    end

    # V3 with JWT sessions, start -----------

    # def create
    #     user = User.create(user_params)
    #     city_profile = CityProfile.create(user_id: user.id, city: params[:city])
    #     if user.valid?
    #         render json: {user: user, token: JWT.encode({user_id: user.id}, "randomstring")}, methods: [:cities, :category_selections, :venue_selections, :city_profiles], status: :created
    #     else
    #     render json: {errors: user.errors.full_messages}, status: :unprocessable_entity
    #     end
    # end

    # def login
    #     user = User.find_by(username: params[:username])
    #     if user&.authenticate(params[:password])
    #         # byebug
    #         render json: {user: user, token: JWT.encode({user_id: user.id}, "randomstring")}, methods: [:cities, :category_selections, :venue_selections, :city_profiles]
    #     else
    #         render json: { errors: ["Invalid username or password"] }, status: :unauthorized
    #     end
    # end

    # def get_user
    #     user = self.current_user
    #     render json: user
    # end

    # V3 end --------------------------------

    # V4 start ------------------------------
    # User signing up -> resources :users, only: [:create]
    def create
        user = User.create(user_params)
        city_profile = CityProfile.create(user_id: user.id, city: params[:city])
        if user.valid?
            payload = {user_id: user.id}
            token = encode_token(payload)
            render json: {user: user, jwt: token}
        else
            render json: {errors: user.errors.full_messages}, status: :unprocessable_entity
        end
    end
    # V4 end --------------------------------

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
        render json: { error: "Item not found" }, status: :not_found
    end

end
