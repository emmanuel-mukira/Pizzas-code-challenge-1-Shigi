class RestaurantPizzasController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:create]

    def create
      restaurant_pizza = RestaurantPizza.new(restaurant_pizza_params)
  
      if restaurant_pizza.save
        pizza = Pizza.find(restaurant_pizza.pizza_id)
        render json: pizza_data(pizza), status: :created
      else
        render json: { errors: restaurant_pizza.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    private
  
    def restaurant_pizza_params
      params.require(:restaurant_pizza).permit(:price, :pizza_id, :restaurant_id)
    end
  
    def pizza_data(pizza)
      {
        id: pizza.id,
        name: pizza.name,
        ingredients: pizza.ingredients
      }
    end
  end
  