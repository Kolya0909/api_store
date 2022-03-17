class Api::V1::TypesController < ApplicationController

  def index
    render json: Type.all
  end

  def create
    @type =  Type.new(type_params)
    if @type.save
    render json: @type
    end
  end

  private

  def type_params
    params.permit(:name)
  end

end
