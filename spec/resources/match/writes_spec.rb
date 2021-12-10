require 'rails_helper'

RSpec.describe MatchResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'matches',
          attributes: { }
        }
      }
    end

    let(:instance) do
      MatchResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Match.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:match) { create(:match) }

    let(:payload) do
      {
        data: {
          id: match.id.to_s,
          type: 'matches',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      MatchResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { match.reload.updated_at }
      # .and change { match.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:match) { create(:match) }

    let(:instance) do
      MatchResource.find(id: match.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Match.count }.by(-1)
    end
  end
end
