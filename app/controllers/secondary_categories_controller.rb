class SecondaryCategoriesController < ApplicationController
    # skip_before_action :logged_in?

    def index
        secondarycats = SecondaryCategory.all
        render json: secondarycats
    end

    def categoryparse
        first = params[:first].to_i
        last = params[:last].to_i
        if params[:primary_category].to_i == 0
            secondarycats = SecondaryCategory.all
            render json: secondarycats[first, last]
            # byebug
        else 
            secondarycats = SecondaryCategory.where(primary_category_id: params[:primary_category])
            render json: secondarycats[first, last]
        #     render json: secondarycats[0, 9]
        end
    end

    def randomize
        secondarycats = SecondaryCategory.all.sample(3)
        render json: secondarycats
    end 
end
