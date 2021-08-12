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
end
