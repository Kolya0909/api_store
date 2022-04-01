class ApplicationController < ActionController::API
  before_action :authenticate_request
  before_action :check_role, only: [:create, :update, :destroy]



  private

  def authenticate_request
    @current_user = AuthUser::UserAuthorize.new(request.headers).call
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end

  def check_role
    if @current_user.first["role"].include?'USER'
      render json: { error: 'Forbidden' }, status: 403
    elsif @current_user.first["role"].include?'ADMIN'
      true
    end
  end



end
