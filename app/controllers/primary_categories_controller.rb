class PrimaryCategoriesController < ApplicationController
    def index
        primarycats = PrimaryCategory.all
        render json: primarycats
    end
end
