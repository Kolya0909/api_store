class Api::V1::BasketsController < ApplicationController

  def index
    @basket = Basket.where(user_id: @current_user.first['user_id']).first
    render json: BasketDevice.where(basket_id: @basket.id)
  end

end
