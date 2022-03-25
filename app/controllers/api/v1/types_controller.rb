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

  def update
    @type = Type.find(params[:id])
    if @type.update(type_params)
      render json: @type
    end
  end

  def destroy
    @type = Type.find(params[:id])
    if @type.destroy
      render json: {massage: "type with id #{params[:id]}, was destroyed"}
    end
  end

  private

  def type_params
    params.require(:type).permit(:name)
  end

end
