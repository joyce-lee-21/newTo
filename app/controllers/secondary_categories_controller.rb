class SecondaryCategoriesController < ApplicationController
    def index
        secondarycats = SecondaryCategory.all
        render json: secondarycats
    end

    def categoryparse
        secondarycats = SecondaryCategory.all
        first = params[:first].to_i
        last = params[:last].to_i
        # if last > 9
            render json: secondarycats[first, last]
        # else 
        #     render json: secondarycats[0, 9]
        # end
    end

    def categoryshow
        query = params[:query].titleize
        # primarycat = PrimaryCategory.all.find_by(name: query)
        primarycat = PrimaryCategory.where("name like ?", "%#{query}%")
        render json: primarycat
    end 

end
