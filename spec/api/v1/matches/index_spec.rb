require "rails_helper"

RSpec.describe "matches#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/matches", params: params
  end

  describe "basic fetch" do
    let!(:match1) { create(:match) }
    let!(:match2) { create(:match) }

    it "works" do
      expect(MatchResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["matches"])
      expect(d.map(&:id)).to match_array([match1.id, match2.id])
    end
  end
end
