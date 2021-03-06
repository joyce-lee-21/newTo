class CityProfilesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index
        profiles = CityProfile.all
        render json: profiles
    end

    def show
        profile = CityProfile.find(params[:id])
        render json: profile
    end

    def create
        profile = CityProfile.create(profile_params)
        render json: profile, status: :created
    rescue ActiveRecord::RecordInvalid => e
        render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
    end

    def destroy
        profile = CityProfile.find(params[:id])
        profile.destroy
        head :no_content
    end

    private

    def profile_params
        params.require(:profile).permit(:user_id, :city)
    end

    def render_not_found_response
        render json: { error: "Item not found" }, status: :not_found
    end

end
