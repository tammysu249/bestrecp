require 'rails_helper'

RSpec.describe "matches#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/matches/#{match.id}", params: params
  end

  describe 'basic fetch' do
    let!(:match) { create(:match) }

    it 'works' do
      expect(MatchResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('matches')
      expect(d.id).to eq(match.id)
    end
  end
end
