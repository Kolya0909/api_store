class Api::V1::UsersController < ApplicationController

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
       render json: { token: token}
     end
  end

  def login
    return render json: {massage: 'password or email invalid'} unless @user = User.find_by_email(params[:email])
    if @user.authenticate(params[:password])
        token = AuthUser::UserAuthentication.new(@user.email,@user.id,@user.role).call
        render json: {token: token}
      else
        render json: {massage: 'password or email invalid'}
    end
  end


  private

  def user_params
    params.permit(:email, :role, :password)
  end

end
