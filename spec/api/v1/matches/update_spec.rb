require "rails_helper"

RSpec.describe "matches#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/matches/#{match.id}", payload
  end

  describe "basic update" do
    let!(:match) { create(:match) }

    let(:payload) do
      {
        data: {
          id: match.id.to_s,
          type: "matches",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(MatchResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { match.reload.attributes }
    end
  end
end
