class ApplicationController < ActionController::API
  before_action :authenticate_request

  private


  def authenticate_request
    @current_user = AuthUser::UserAuthorize.new(request.headers).call
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end

end
