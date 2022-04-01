class Api::V1::RatingsController < ApplicationController

  def index

  end

  def create

  end

  def update

  end

  def rating_params
    params.permit(:user_idь, :device_id, :rate)
  end

end

