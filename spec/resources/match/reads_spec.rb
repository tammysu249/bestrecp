require "rails_helper"

RSpec.describe MatchResource, type: :resource do
  describe "serialization" do
    let!(:match) { create(:match) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(match.id)
      expect(data.jsonapi_type).to eq("matches")
    end
  end

  describe "filtering" do
    let!(:match1) { create(:match) }
    let!(:match2) { create(:match) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: match2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([match2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:match1) { create(:match) }
      let!(:match2) { create(:match) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      match1.id,
                                      match2.id,
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
                                      match2.id,
                                      match1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
