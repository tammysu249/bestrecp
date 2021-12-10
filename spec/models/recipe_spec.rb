require 'rails_helper'

RSpec.describe Recipe, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:matches) }

    it { should belong_to(:category) }

    end

    describe "InDirect Associations" do

    it { should have_many(:recipe_categories) }

    end

    describe "Validations" do

    end
end
