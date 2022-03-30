class Api::V1::DevicesController < ApplicationController

  def index
    render json: DeviceFilter::DeviceFilterByTypeBrand.new(params).call
  end

  def create
    @device = Device.new(device_params)
    if @device.save
      @brands_types = BrandType.new(brand_id: params[:brand_id], type_id: params[:type_id])
      @brands_types.save
      render json: @device
    end
  end

  def update
    @device = Device.find(params[:id])
    if @device.update(device_params)
      render json: {massage: "device with id #{params[:id]}, was updated"}
    end
  end

  def destroy
    @device = Device.find(params[:id])
    if @device.destroy
      render json: {massage: "device with id #{params[:id]}, was destroyed"}
    end
  end


  private
  def device_params
    params.permit(:name, :price, :rating, :img, :type_id, :brand_id, :image)
  end


end
