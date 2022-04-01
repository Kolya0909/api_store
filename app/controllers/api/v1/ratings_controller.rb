class Api::V1::RatingsController < ApplicationController
  skip_before_action :check_role

  def index
    render json: Rating.all
  end

  def create
    @user = User.find(params[:user_id])
    if Rating.where(user_id: params[:user_id], device_id: params[:device_id]).first
      render json: {massage: 'you already put rete '}
    else
      @rate = Rating.new(rating_params)
      if @rate.save
        render json: @rate
        Rate::AddRatingToDevice.new(params[:device_id]).call
      end
    end
  end

  def destroy
    @rate = Rating.find(params[:id])
    if @rate.destroy
      render json: {massage: "rate with id = #{params[:id]}, was destroyed"}
    end
  end

  def rating_params
    params.permit(:user_id, :device_id, :rate)
  end

end

