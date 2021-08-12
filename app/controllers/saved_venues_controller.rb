class SavedVenuesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    
    def index
        venues = SavedVenue.all
        render json: venues
    end

    def create
        venue = SavedVenue.create(venue_params)
        render json: venue, status: :created
    rescue ActiveRecord::RecordInvalid => e
        render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity

    end

    def destroy
        # venue = SavedVenue.find(params[:id])
        @saved_venue.destroy
        head :no_content
    end

    private

    def venue_params
        params.require(:venue).permit(:city_profile_id, :name, :address, :url, :rating, :fs_venue_id, :lat, :long)
    end

    def render_not_found_response
        render json: { error: "Item not found" }, status: :not_found
    end

end
