class Api::V1::BasketDevicesController < ApplicationController

  def create
    @basket = Basket.where(user_id: @current_user.first["user_id"]).take
    @basket_device = BasketDevice.new(basket_id: @basket.id, device_id: params[:device_id])
    if @basket_device.save
      render json: @basket_device
    end
  end

  def destroy
    @basket_device = BasketDevice.find(params[:id])
    if @basket_device.destroy
      render json: {massage: "BasketDevice with id #{params[:id]}, was destroyed"}
    end
  end

end
