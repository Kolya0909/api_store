RSpec.describe TypesController, type: :controller do

  describe "Get index" do
    it 'returns types array' do
      expect(response).to eq Type.all
    end
  end

end