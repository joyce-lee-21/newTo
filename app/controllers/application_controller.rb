class ApplicationController < ActionController::Base
    include ActionController::Cookies
    
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    # before_action :authorize
    skip_before_action :verify_authenticity_token
    helper_method :login!, :logged_in?, :current_user, :authorized_user?, :logout!, :set_user

    def login!
        session[:user_id] = @user.id
    end

    def logged_in?
        !!session[:user_id]
    end

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def authorized_user?
        @user == current_user
    end

    def logout!
        session.clear
    end

    def set_user
        @user = User.find_by(id: session[:user_id])
    end

    private 
    # def authorize
    #     current_user = User.find_by(id: session[:user_id])
    #     # byebug
    #     render json: {message:"Please login first"}, status: :unauthorized unless current_user
    # end

    def render_unprocessable_entity_response(exception)
        render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
    end

    
end
