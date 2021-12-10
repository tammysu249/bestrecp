require 'rails_helper'

RSpec.describe "chefs#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/chefs", params: params
  end

  describe 'basic fetch' do
    let!(:chef1) { create(:chef) }
    let!(:chef2) { create(:chef) }

    it 'works' do
      expect(ChefResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['chefs'])
      expect(d.map(&:id)).to match_array([chef1.id, chef2.id])
    end
  end
end
