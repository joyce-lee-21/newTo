class ApplicationController < ActionController::API
    include ActionController::Cookies

    def current_user
        session[:user_id] ? User.find(session[:user_id]) : nil
    end

    def authorize
        if(!current_user.present?)
            return render json: {message:"Please login first"}, status: 401
        end
    end
end
