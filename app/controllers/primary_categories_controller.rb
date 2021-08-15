class PrimaryCategoriesController < ApplicationController

    def index
        primarycats = PrimaryCategory.all
        render json: primarycats
    end

    def categoryshow
        query = params[:query].titleize
        # primarycat = PrimaryCategory.all.find_by(name: query)
        primarycat = PrimaryCategory.where("name like ?", "%#{query}%")
        render json: primarycat
    end 

    def categoryparse
        primarycats = PrimaryCategory.all
        first = params[:first].to_i
        last = params[:last].to_i
        # if last > 9
            render json: primarycats[first, last]
        # else 
        #     render json: secondarycats[0, 9]
        # end
    end
end
