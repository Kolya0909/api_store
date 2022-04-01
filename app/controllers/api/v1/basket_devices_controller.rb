class Api::V1::BasketDevicesController < ApplicationController

  def index
    render json: @current_user
  end

  def create
    @device = Device.find(params[:id])

  end

end
