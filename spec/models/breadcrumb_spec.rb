require 'rails_helper'

RSpec.describe Breadcrumb, type: :model do

  describe "attributes" do

    before(:each) do
      @crumb = build(:breadcrumb)
    end

    it "has a latitude" do
      expect(@crumb.lat).to eq(47.6320767091718)
    end

    it "has a longitude" do
      expect(@crumb.long).to eq(-122.033664280162)
    end

    it "has a title" do
      expect(@crumb.title).to eq("You've got a breadCrumb!")
    end

    it "has a subtitle" do
      expect(@crumb.subtitle).to eq("hello seattle")
    end

    it "has an identifier" do
      expect(@crumb.identifier).to eq("44C8D038-7815-45D3-B3D2-40E1A6191C3B")
    end

    

    it "is valid with these attributes" do
      expect(@crumb.valid?).to be(true)
    end
  end

end
