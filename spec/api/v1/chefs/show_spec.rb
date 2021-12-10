require "rails_helper"

RSpec.describe "chefs#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/chefs/#{chef.id}", params: params
  end

  describe "basic fetch" do
    let!(:chef) { create(:chef) }

    it "works" do
      expect(ChefResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("chefs")
      expect(d.id).to eq(chef.id)
    end
  end
end
