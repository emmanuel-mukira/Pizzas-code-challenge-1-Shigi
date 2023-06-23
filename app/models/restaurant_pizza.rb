class RestaurantPizza < ApplicationRecord
    belongs_to :pizza 
    belongs_to :restaurant
   
    validates :price, presence: true, inclusion: { in: 1..30 }

end
