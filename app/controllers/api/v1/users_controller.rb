class Api::V1::UsersController < ApplicationController
  skip_before_action :authenticate_request
  skip_before_action :check_role

  def registration
    if User.find_by_email(params[:email])
      render json: { massage: 'email was used' }
    else
      @user = User.new(user_params)
      if @user.save
         token = AuthUser::UserAuthentication.new(@user.email, @user.id, @user.role).call
         @basket = Basket.new(user_id: @user.id)
         @basket.save
      end
    end
     if token.present?
       render json: token
     end
  end

  def login
    return render json: { massage: 'password or email invalid' } unless @user = User.find_by_email(params[:email])
    if @user.authenticate(params[:password])
      auth_info = AuthUser::UserAuthentication.new(@user.email,@user.id,@user.role).call
        render json: {token: auth_info[:token]}
      else
        render json: { massage: 'password or email invalid' }
    end
  end

  def auth
    if AuthUser::RegenerateToken.new(request.headers).call
      render json:  AuthUser::RegenerateToken.new(request.headers).call
    else
      render json: { error: 'Not Authorized' }, status: 401
    end
  end

  private

  def user_params
    params.permit(:email, :password, :role)
  end

end
