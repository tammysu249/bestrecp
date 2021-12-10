require "rails_helper"

RSpec.describe "chefs#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/chefs/#{chef.id}"
  end

  describe "basic destroy" do
    let!(:chef) { create(:chef) }

    it "updates the resource" do
      expect(ChefResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Chef.count }.by(-1)
      expect { chef.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
