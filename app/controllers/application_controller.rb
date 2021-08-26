class ApplicationController < ActionController::API
    # include ActionController::Cookies
    
    # rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def current_user
        # byebug
        begin
            method, token = request.headers[:Authorization].split(' ')
            # byebug
            if method === "Bearer"
                payload,header = JWT.decode(token,"randomstring")
                return User.find(payload["user_id"])
            end
        # rescue
        #     raise Exception.new("Must be logged in")
        end
    end

    def logged_in?
        !!current_user
    end

    # private

    # def authorize
    #     current_user = User.find_by(id: session[:user_id])
    #     # byebug
    #     render json: {message:"Please login first"}, status: :unauthorized unless current_user
    # end

    # def render_unprocessable_entity_response(exception)
    #     render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
    # end

    
end
