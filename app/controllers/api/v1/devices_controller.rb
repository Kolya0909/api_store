class Api::V1::DevicesController < ApplicationController

  def index
    render json: DeviceFilter::DeviceFilterByTypeBrand.new(params).call
  end

  def create
    @device = Device.new(device_params)
    if @device.save
      render json: @device
    end
  end


  private
  def device_params
    params.permit(:name, :price, :rating, :img, :type_id, :brand_id, :image)
  end


end
