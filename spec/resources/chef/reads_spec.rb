require "rails_helper"

RSpec.describe ChefResource, type: :resource do
  describe "serialization" do
    let!(:chef) { create(:chef) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(chef.id)
      expect(data.jsonapi_type).to eq("chefs")
    end
  end

  describe "filtering" do
    let!(:chef1) { create(:chef) }
    let!(:chef2) { create(:chef) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: chef2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([chef2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:chef1) { create(:chef) }
      let!(:chef2) { create(:chef) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      chef1.id,
                                      chef2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      chef2.id,
                                      chef1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
