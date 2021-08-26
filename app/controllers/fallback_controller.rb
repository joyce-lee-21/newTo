class FallbackController < ApplicationController
    skip_before_action :logged_in?
    
    def index
        # React app index page
        render file: 'public/index.html'
    end
end
