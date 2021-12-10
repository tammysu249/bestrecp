require "rails_helper"

RSpec.describe "chefs#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/chefs/#{chef.id}", payload
  end

  describe "basic update" do
    let!(:chef) { create(:chef) }

    let(:payload) do
      {
        data: {
          id: chef.id.to_s,
          type: "chefs",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(ChefResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { chef.reload.attributes }
    end
  end
end
