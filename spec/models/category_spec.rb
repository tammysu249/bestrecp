require 'rails_helper'

RSpec.describe Category, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:chef) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
