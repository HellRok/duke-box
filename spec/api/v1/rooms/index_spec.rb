require 'rails_helper'

RSpec.describe "rooms#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/rooms",
      params: params
  end

  describe 'basic fetch' do
    let!(:room1) { create(:room) }
    let!(:room2) { create(:room) }

    it 'serializes the list correctly' do
      make_request
      expect(json_ids(true)).to match_array([room1.id, room2.id])
      assert_payload(:room, room1, json_items[0])
      assert_payload(:room, room2, json_items[1])
    end
  end
end
