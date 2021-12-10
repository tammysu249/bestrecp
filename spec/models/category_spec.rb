require "rails_helper"

RSpec.describe Category, type: :model do
  describe "Direct Associations" do
    it { should have_many(:matches) }

    it { should have_many(:recipes) }

    it { should belong_to(:chef) }
  end

  describe "InDirect Associations" do
    it { should have_many(:category_recipes) }
  end

  describe "Validations" do
  end
end
