require 'rails_helper'

RSpec.describe BusesController, type: :controller do

  describe "GET #show" do
    before do
      allow_any_instance_of(BusDecorator).to receive(:routes_left_from).with(nil) { nil }
    end

    it "returns http success" do
      get :show, id: 1
      expect(response).to have_http_status(:success)
    end
  end

end
