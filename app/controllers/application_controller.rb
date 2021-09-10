class ApplicationController < ActionController::API
    # include ActionController::Cookies
    
    # rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    # V3 start --------------------------------
    # def current_user
    #     # byebug
    #     begin
    #         method, token = request.headers[:Authorization].split(' ')
    #         # byebug
    #         if method === "Bearer"
    #             payload,header = JWT.decode(token,"randomstring")
    #             return User.find(payload["user_id"])
    #         end
    #     # rescue
    #     #     raise Exception.new("Must be logged in")
    #     end
    # end

    # def logged_in?
    #     !!current_user
    # end

    # private

    # def authorize
    #     current_user = User.find_by(id: session[:user_id])
    #     # byebug
    #     render json: {message:"Please login first"}, status: :unauthorized unless current_user
    # end

    # def render_unprocessable_entity_response(exception)
    #     render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
    # end
    # V3 end ----------------------------------

    # V4 start --------------------------------

    def encode_token(payload)
        JWT.encode(payload, 'my_secret')
    end

    def session_user
        decoded_hash = decoded_token
        if !decoded_hash.empty?
            user_id = decoded_hash[0]['user_id']
            @user = User.find_by(id: user_id)
        else
            nil
        end
    end

    def auth_header
        request.headers['Authorization']
    end

    def decoded_token
        if auth_header
            token = auth_header.split(' ')[1]
            begin
                JWT.decode(token, 'my_secret', true, algorithm: 'HS256')
            rescue JWT::DecodeError
                []
            end
        end
    end
    # V4 end ----------------------------------
end
