require "rails_helper"

RSpec.describe "matches#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/matches/#{match.id}"
  end

  describe "basic destroy" do
    let!(:match) { create(:match) }

    it "updates the resource" do
      expect(MatchResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Match.count }.by(-1)
      expect { match.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
