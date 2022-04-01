class Api::V1::RatingsController < ApplicationController

  def index

  end

  def create

  end

  def update

  end

  def rating_params
    params.permit(:user_id, :device_id, :rate)
  end

end

