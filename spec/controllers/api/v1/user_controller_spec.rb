require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do

  SECRET_KEY = 'RTX_XFX'
  let (:registration_param) do
    {
      email: 'admin@ukr.net',
      password: '123456',
      role: 'admin'
    }
  end

  let (:login_param) do
    {
      email: 'lociko@ukr.net',
      password: 'lociko'
    }
  end


  describe 'registration' do

    it 'return info about new user and jwt token' do
      post :registration, params: registration_param, format: :json
      resp_info =  JSON.parse(response.body)
      user_info = JWT.decode(resp_info["token"], SECRET_KEY)
      expect(user_info.first["email"]).to eq registration_param[:email]
      expect(user_info.first["role"]).to eq registration_param[:role]
    end

  end

  describe 'login' do

    it 'return jwt token user' do
      post :login, params: login_param, format: :json
      expect(response).to have_http_status(:ok)
    end

  end

end