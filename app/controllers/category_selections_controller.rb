class CategorySelectionsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    # skip_before_action :logged_in?
    
    def index
        selections = CategorySelection.all
        render json: selections
    end

    def create
        selection = CategorySelection.create(selection_params)
        render json: selection, status: :created
        # byebug
    rescue ActiveRecord::RecordInvalid => e
        render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
    end

    def update
        selection = CategorySelection.find(params[:id])
        selection.update(selection_params)
        render json: selection, status: :accepted
    rescue ActiveRecord::RecordInvalid => e
        render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
    end

    def destroy
        selection = CategorySelection.where(:city_profile_id => params[:id])
        selection.destroy_all
        head :no_content
    end

    private

    def selection_params
        params.require(:category_selection).permit(:name, :city_profile_id, :fs_category_id, :primary_category_id)
    end

    def render_not_found_response
        render json: { error: "Item not found" }, status: :not_found
    end

end
