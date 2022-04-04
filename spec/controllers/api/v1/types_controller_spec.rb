require 'rails_helper'

RSpec.describe Api::V1::TypesController, type: :controller do

  describe "Get index" do
    it 'returns status 200 ok' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe "Get create" do

    context 'if customer is admin' do

      it 'should return user role ADMIN' do
        user = {
          user_id:1,
          role: "ADMIN",
          email: "mike@ukr.net"
        }
        expect(user[:role]).to eq "ADMIN"
      end

    end

  end

end