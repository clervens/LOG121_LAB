class MenusController < ApplicationResourcesController
	before_action :set_restaurant, only: [:new, :index]
	before_action :set_restaurant_and_menu, only: [:show, :edit, :update, :destroy]
    belongs_to :restaurant

	def new
		@menu = @restaurant.menus.build
	end
  private

    def menu_params
      params.require(:menu).permit({plats_attributes: [:id, :nom, :prix, :description, :_destroy]}, :nom, :restaurant_id)
    end

    def set_restaurant_and_menu
    	set_restaurant
        set_menu
    end

    def set_restaurant
    	@restaurant = Restaurant.find params[:restaurant_id]
    end

    def set_menu
    	@menu = @restaurant.menus.find params[:id]
    end
end

