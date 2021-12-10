require 'rails_helper'

RSpec.describe ChefResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'chefs',
          attributes: { }
        }
      }
    end

    let(:instance) do
      ChefResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Chef.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:chef) { create(:chef) }

    let(:payload) do
      {
        data: {
          id: chef.id.to_s,
          type: 'chefs',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      ChefResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { chef.reload.updated_at }
      # .and change { chef.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:chef) { create(:chef) }

    let(:instance) do
      ChefResource.find(id: chef.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Chef.count }.by(-1)
    end
  end
end
