class Api::V1::BrandsController < ApplicationController

  def index
    render json: Brand.all
  end

  def create
    @brand =  Brand.new(type_params)
    if @brand.save
      render json: @brand
    end
  end

  private

  def type_params
    params.require(:brand).permit(:name)
  end

end
