class SecondaryCategoriesController < ApplicationController
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

    def categoryshow
        query = params[:query].titleize
        # primarycat = PrimaryCategory.all.find_by(name: query)
        primarycat = PrimaryCategory.where("name like ?", "%#{query}%")
        render json: primarycat
    end 

end
