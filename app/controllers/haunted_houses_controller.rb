class HauntedHousesController < ApplicationController
    def index 
        render json: HauntedHouse.all
    end
end
