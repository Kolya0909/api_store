class Api::V1::DeviceInfosController < ApplicationController

  def crate
    @device_infos = DeviceInfo.new(devise_infos_params)
    if @device_infos.save
      render json: @device_infos
    end
  end

  def update
    @device_infos = DeviceInfo.find(params[:id])
    if @device_infos.update(devise_infos_params)
      render json: {massage: "device_infos with id #{params[:id]}, was updated"}
    end
  end

  def destroy
    @device_infos = DeviceInfo.find(params[:id])
    if @device_infos.destroy
      render json: {massage: "device_infos with id #{params[:id]}, was destroyed"}
    end
  end

  private

  def devise_infos_params
    params.require(:device_infos).permit(:title, :description, :devise_id)
  end
end
