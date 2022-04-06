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

  let (:invalid_login_params) do
    {
      email: 'lociko@ukr.net',
      password: 'lociffko'
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

    context 'with valid params' do
      it 'return jwt token user' do
        post :login, params: login_param, format: :json
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid params' do

      it 'should return password or email invalid' do
        post :login, params: invalid_login_params, format: :json
        resp_text = JSON.parse(response.body)
        expect(resp_text["massage"]).to eq 'password or email invalid'
      end

      it 'should return email was used' do
        post :registration, params: login_param, format: :json
        resp_text = JSON.parse(response.body)
        expect(resp_text["massage"]).to eq 'email was used'
      end

    end


  end


end