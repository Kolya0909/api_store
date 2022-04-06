require 'rails_helper'

RSpec.describe Api::V1::TypesController, type: :controller do

  let(:param) do
    {
      name: 'Audio'
    }
  end

  describe "GET index" do
    it 'returns status 200 ok' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST create" do

    context 'if customer is admin' do

      it 'should return http_status_created' do
        user = {
          user_id:1,
          role: "ADMIN",
          email: "mike@ukr.net"
        }
        resp = AuthUser::UserAuthentication.new(user[:email],user[:user_id],user[:role]).call
        request.headers['Authorization'] = "Bearer #{resp[:token]}"
        post :create, params: param, format: :json
        expect(response).to have_http_status(201)
      end

    end

  end

end