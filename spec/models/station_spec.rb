require 'rails_helper'

RSpec.describe Station, type: :model do
  describe "#buses" do
    let!(:bus) { create :bus }
    let(:station) { create :station }

    it "returns buses that passes along the current bus station" do
      expect(station.buses).to eq [bus]
    end
  end
end
