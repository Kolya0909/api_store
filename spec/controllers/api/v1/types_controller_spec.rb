RSpec.describe Api::V1::TypesController, type: :controller do

  describe "Get index" do
    it 'returns types array' do
      expect(response).to have_http_status(:ok)
    end
  end

end